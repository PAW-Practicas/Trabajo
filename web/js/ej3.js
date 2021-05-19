window.addEventListener("load",ej3);

function ej3(){
    var eye=document.querySelectorAll(".verContr");
    eye.forEach(x => x.addEventListener("click", e => {
        if(e.currentTarget.firstChild.className === "fas fa-eye-slash") {
        e.currentTarget.firstChild.className = "fas fa-eye";
        e.currentTarget.type = "text";
        }
        else 
            {
            e.currentTarget.firstChild.className = "fas fa-eye-slash";
            e.currentTarget.type = "password";
        }
        e.preventDefault();
    }));   
}

