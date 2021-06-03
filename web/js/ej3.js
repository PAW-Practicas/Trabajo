window.addEventListener("load",ej3);

function ej3(){
    var eye=document.querySelectorAll(".verContr");
    eye.forEach(x => x.addEventListener("click", e => {
        
        var padre=e.currentTarget.parentNode
        var textbox=padre.getElementsByTagName("input").item(0)
        
        if(e.currentTarget.firstChild.className === "fas fa-eye-slash") {
        
            
        e.currentTarget.firstChild.className = "fas fa-eye";
        
        
        
        textbox.type = "text";
        }
        else 
            {
            e.currentTarget.firstChild.className = "fas fa-eye-slash";
            textbox.type = "password";
        }
        e.preventDefault();
    }));   
}

