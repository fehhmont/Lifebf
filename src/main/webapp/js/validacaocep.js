

let timer;
function limpa_formulario_cep() {
    // Limpa valores do formulário de CEP.
    document.getElementById('rua').value = "";
    document.getElementById('bairro').value = "";
    document.getElementById('cidade').value = "";
    document.getElementById('estado').value = "";
}

function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        // Atualiza os campos com os valores.
        document.getElementById('rua').value = conteudo.logradouro;
        document.getElementById('bairro').value = conteudo.bairro;
        document.getElementById('cidade').value = conteudo.localidade;
        document.getElementById('estado').value = conteudo.uf;
    } else {
        // CEP não encontrado.
        limpa_formulario_cep();
        alert("CEP não encontrado.");
    }
}

function pesquisacep(valor) {
    // Nova variável "cep" somente com dígitos.
    var cep = valor.replace(/\D/g, '');

    // Verifica se o campo CEP possui valor informado.
    if (cep !== "" && cep.length === 8) {
        // Expressão regular para validar o CEP.
        var validacep = /^[0-9]{8}$/;

        // Valida o formato do CEP.
        if (validacep.test(cep)) {
            // Preenche os campos com "..." enquanto consulta o webservice.
            document.getElementById('rua').value = "...";
            document.getElementById('bairro').value = "...";
            document.getElementById('cidade').value = "...";
            document.getElementById('estado').value = "...";

            // Cria um elemento javascript.
            var script = document.createElement('script');

            // Sincroniza com o callback.
            script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

            // Insere o script no documento e carrega o conteúdo.
            document.body.appendChild(script);
        } else {
            // CEP é inválido.
            limpa_formulario_cep();
            alert("Formato de CEP inválido.");
        }
    } else {
        // CEP sem valor, limpa o formulário.
        limpa_formulario_cep();
    }
}

// Adiciona um evento de input ao campo CEP com delay
document.getElementById('cep').addEventListener('input', function() {
    clearTimeout(timer); // Limpa o tempo anterior
    timer = setTimeout(function() {
        pesquisacep(document.getElementById('cep').value);
    }, 500); // Atraso de 500ms após o usuário terminar de digitar
});

// Função para aplicar máscara de CEP (XXXXX-XXX)
function mascaraCEP(cep) {
    cep.value = cep.value.replace(/\D/g, '') // Remove caracteres não numéricos
                          .replace(/^(\d{5})(\d)/, '$1-$2'); // Adiciona o hífen após 5 dígitos
}







