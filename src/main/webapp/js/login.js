async function login(){
    const email = document.querySelector("#email").value;
    const senha = document.querySelector("#senha").value;
    const response = await fetch("login", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: `email=${encodeURIComponent(email)}&senha=${encodeURIComponent(senha)}`
                });
    console.log(response);
}