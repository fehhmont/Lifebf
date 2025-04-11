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
