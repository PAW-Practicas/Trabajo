window.addEventListener("load", ej11);

function ej11() {


    var a = document.getElementsByTagName("tr");
    
    //2 primeras filas de la tabla no valen
    for(let x=2;x < a.length; x++){
            
        let y=a.item(x);
        y.addEventListener("dblclick", function (e) {
           var hijos=y.getElementsByTagName("a");
           var enlace=hijos.item(1).innerText;
           window.open("http://localhost:8080/PAW-pr9/FichaArticulo?codArt="+enlace,enlace,"width=800,height=500");
        });

    }
    
    

}
