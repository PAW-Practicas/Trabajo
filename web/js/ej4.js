window.addEventListener("load",ej4);

function ej4(){
    
    //1 esconder los desplegables
    var n =document.getElementById("nombre");
    var c =document.getElementById("codigo");
    n.hidden=true;
    n.disabled=true;
    c.hidden=true;
    c.disabled=true;
    
    //2 crear el nuevo elemento
//<span>1
//&nbsp; 
//	<button style="backgroundcolor:white; border:none">//3
//		<span class="fas fa-ellipsis-v"></span>
//	</button>
//</span>.  
    var span = document.createElement("span");//1
    span.innerHTML = "&nbsp;";
    
    var tresPuntos = document.createElement("button");//2
    tresPuntos.style.backgroundColor="white";
    tresPuntos.style.border="none";
    
    var f3=document.createElement("span");//3
    f3.className="fas fa-ellipsis-v";
    
    tresPuntos.appendChild(f3);
    span.appendChild(tresPuntos);
    
    
    //la lupa de busqueda
    var busquedaBoton = document.getElementById("buscar");
    
    var filtroCatalogo= document.getElementById("filtroCatalogo");
    
//    filtroCatalogo.insertBefore(busquedaBoton)
    filtroCatalogo.insertBefore(tresPuntos, busquedaBoton) ;
    
    
    tresPuntos.addEventListener("click",function(e){
         n.hidden=false;
         n.disabled=false;
         c.hidden=false;
         c.disabled=false;
         
        
         tresPuntos.hidden=true;
         tresPuntos.disabled=true;
         e.preventDefault();
    });
    
}

