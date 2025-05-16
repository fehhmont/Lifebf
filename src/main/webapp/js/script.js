// Menu mobile toggle
document.addEventListener('DOMContentLoaded', function() {
    getPlanos();
});

// Smooth scroll para links internos
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const href = this.getAttribute('href');
        if (href !== '#') {
            document.querySelector(href).scrollIntoView({
                behavior: 'smooth'
            });
        }
    });
});

// Animação de fade-in para os cards de features
const observerOptions = {
    threshold: 0.1
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

document.querySelectorAll('.feature-card').forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(20px)';
    card.style.transition = 'all 0.5s ease-out';
    observer.observe(card);
});

// Efeito de hover nos botões
const buttons = document.querySelectorAll('button');
buttons.forEach(button => {
    button.addEventListener('mouseenter', function() {
        this.style.transform = 'scale(1.05)';
    });

    button.addEventListener('mouseleave', function() {
        this.style.transform = 'scale(1)';
    });
});

document.getElementById("loginButton").addEventListener("click", function() {
    window.location.href = "../login.html";
});
document.getElementById("comeceButton").addEventListener("click", function() {
    window.location.href = "../cadastro.html";
});
async function getPlanos(){
    console.log('teste');
    const url = "http://localhost:8080/planos";
    await fetch(url)
    .then((res) => res.json())
    .then((resp) => console.log(resp))
    .catch((err) => console.log(err))
}