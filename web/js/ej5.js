window.addEventListener("load",ej5);

function ej5(){
    
  var a = document.querySelectorAll(".item");
   document.querySelectorAll(".item").forEach(x=> {
        x.addEventListener("mouseover",function(e){
                    e.currentTarget.style="-webkit-box-shadow: 0px 20px 20px 0px rgba(0, 0, 0, 0.15);-moz-box-shadow: 0px 20px 20px 0px rgba(0, 0, 0, 0.15);box-shadow: 0px 20px 20px 0px rgba(0, 0, 0, 0.15);z-index: 10;position: relative;";
                    e.preventDefault();
                });
                x.addEventListener("mouseleave",function(e){
                    e.currentTarget.style="";
                    e.preventDefault();
                });
        
        
        
    });

    
    
    
}

