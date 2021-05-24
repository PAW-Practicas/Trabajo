window.addEventListener("load", ej12);

function ej12() {

    //parte izq
    var tipo = document.getElementById("otroTip");
    //drccha
    var fabr = document.getElementById("otroFab");

    //primera carga
    var ca = document.getElementById("otrotipoCont");
   ca.style.display = "none";
   var cb = document.getElementById("otrofabricanteCont");
   cb.style.display = "none";






    tipo.addEventListener("click",function(e){
        var tipoListBox = document.getElementById("tipo");
        var cuadradoBlancoDeAbajo = document.getElementById("otrotipoCont");
        
        if(tipo.checked){
        tipoListBox.disabled=true;
        cuadradoBlancoDeAbajo.style.display = "block";
        }
        else{
            tipoListBox.disabled=false;
            cuadradoBlancoDeAbajo.style.display = "none";
            var texto=cuadradoBlancoDeAbajo.getElementsByTagName("input");
            texto.item(0).value="";
//            texto.innerHtml="";
//            texto.text="";
        }
    

    });
    
    
  
    
    
    //parte derecha
    var fabricante = document.getElementById("otroFab");  
    //var right=document.getElementsByClassName("right");
    


    fabricante.addEventListener("click",function(e){
        var fabricanteListBox = document.getElementById("fabricante");
        var cuadrado2 =document.getElementById("otrofabricanteCont");
        
        if(fabr.checked){
            fabricanteListBox.disabled=true;
            cuadrado2.style.display = "block";
        }
        else{
            
            fabricanteListBox.disabled=false;
            cuadrado2.style.display = "none";
            var texto=cuadrado2.getElementsByTagName("input");
            texto.item(0).value=""
        
        
        }
    

    });
    



}
