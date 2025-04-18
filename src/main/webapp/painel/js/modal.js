
function openModal() {
    document.getElementById('modalOverlay').style.display = 'flex';
}

function closeModal() {
    document.getElementById('modalOverlay').style.display = 'none';
}

function openModal1() {
    console.log("Abrindo modal de edição");
    document.getElementById('modaledit').style.display = 'flex';
}

function closeModal1() {
    console.log("Fechando modal de edição");
    document.getElementById('modaledit').style.display = 'none';
}

// Esconde automaticamente mensagens após 3 segundos
setTimeout(() => {
    const mensagens = document.querySelectorAll('.mensagem');
    mensagens.forEach(el => el.style.opacity = '0');
}, 3000);