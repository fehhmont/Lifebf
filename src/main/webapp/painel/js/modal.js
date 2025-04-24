
function openAlterar() {
    document.getElementById('modalAlterarOverlay').style.display = 'flex';
}

function closeAlterarModal() {
    document.getElementById('modalAlterarOverlay').style.display = 'none';
}

// Esconde automaticamente mensagens após 3 segundos
setTimeout(() => {
    const mensagens = document.querySelectorAll('.mensagem');
    mensagens.forEach(el => el.style.opacity = '0');
}, 3000);