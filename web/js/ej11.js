window.addEventListener("load", ej11);

function ej11() {


    var a = document.querySelectorAll(".item");
    
    
    for(let x of a){
            
        x.addEventListener("dblclick", function (e) {
           var hijos=x.getElementsByClassName("codigo").item(0);
              var enlace=hijos.innerText;
          window.open("http://localhost:8080/PAW-pr8/FichaArticulo?codArt="+enlace,enlace,"width=800,height=500");
        });
           // 
//            var enlace=e.currentTarget.querySelector('.carro a').href;
            //
    }
    
    

}
