 window.addEventListener("load",init) ;
           
            
        function init(){
            var as = document.querySelector(".modovisual").getElementsByTagName("a");
            as[0].addEventListener("click",function(evt){
              cambiadorCss.setHojaCss("mosaico") ;
              evt.preventDefault();
            });
            as[1].addEventListener("click",function(evt){
              cambiadorCss.setHojaCss("lista") ;
              evt.preventDefault();
            });
            
            
            
            //ejercicio 2 
             window.addEventListener("load",init) ;
           
            
        function init(){
            var as = document.querySelector(".modovisual").getElementsByTagName("a");
            as[0].addEventListener("click",function(evt){
              cambiadorCss.setHojaCss("mosaico") ;
              evt.preventDefault();
            });
            as[1].addEventListener("click",function(evt){
              cambiadorCss.setHojaCss("lista") ;
              evt.preventDefault();
            });
            
            
            
            //ejercicio 2 
            var x= document.getElementById("precio");
         
            var precio="${precio}";
            var precios = ["- Cualquiera -","10-100", "100-200","200-500","500-1000","1000"];
            
            
            var value =["-1","10-50","100-200","200-500","500-1000","1000"] ;

            for(i=0;i<precios.length;i++)
            {
                let option = document.createElement("option");
                option.text=precios[i];
                option.value=value[i];
                x.add(option);
            }

            var pr ='${precio}';
            if(pr!==-1){
                x.value=pr;
            }
            
        
   
        
    
    }
        
   
        
    
    }
    