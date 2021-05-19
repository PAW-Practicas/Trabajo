window.addEventListener("load",ej6);

function ej6(){
            var selects = document.getElementsByTagName("select");
            for (const item of selects) {
                item.addEventListener("change",function(evt){
                    var form = document.getElementById("filtroCatalogo");
                    form.submit();
                    evt.preventDefault();
                });
            }
        }
