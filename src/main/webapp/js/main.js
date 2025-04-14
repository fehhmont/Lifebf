    function openModal() {
      document.getElementById('modalOverlay').style.display = 'flex';
      console.log('teste')
    }

    function closeModal() {
      document.getElementById('modalOverlay').style.display = 'none';
    }

    window.onclick = function(event) {

      const modal = document.getElementById('modalOverlay');
      if (event.target === modal) {
        closeModal();
      }
    }



        window.addEventListener('DOMContentLoaded', function () {
            const mensagens = document.querySelectorAll('.mensagem');

            mensagens.forEach(msg => {
                setTimeout(() => {
                    msg.style.opacity = '0'; // fade out
                    setTimeout(() => msg.remove(), 500); // remove após fade
                }, 3000); // mostra por 3 segundos
            });
        });

