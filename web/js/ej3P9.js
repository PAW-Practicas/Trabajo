window.addEventListener("load", ej4_9);
function ej4_9(e) {

//parte izq
var cp = document.getElementsById("cp");
        var chisme = e.currentTarget


        cp.addEventListener("change", f(e));
       
    }
    
    function f(e){
        
        var cp=e.currentTarget
        var provincia =cp.value
         axios('api/GetProvincia', {
        params: {CP: provincia},
                responseType: 'text'
        })
                .then(response => {
                var respuesta = response.data
                
            var provincia = document.getElementsById("provincia");
                        provincia.selected = "respuesta"

                }).catch(err => {
        alert('Error [' + err + ']')
        })



        }
    