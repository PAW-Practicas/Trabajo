window.addEventListener("load",ej6);

function ej6(){
           var selects= document.getElementsByTagName("select");
            for (let x of selects) {
                x.addEventListener("change",function(e){
                    var form = document.getElementById("filtroCatalogo");
                    e.target
                    e.target.value
                    
                    form.submit();
                    e.preventDefault();
                });
            }
        }
