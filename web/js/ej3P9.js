window.addEventListener("load", ej3);
function ej3(e) {

    //parte izq
    var cantidad = document.getElementsByClassName("cantidad");
    for (let e of cantidad) {
        e.addEventListener("change", function (e) {
            var valor = this.value
            var cod = e.name.split("_")[1];
        
        
        
             axios('api/GetStockArticulo', {
            params : {cart:'${art.codigo}'}, // o {cart:'<%= art.getCodigo()%>'}
            responseType: 'text'
            })
            .then(response => {
            actualizaStock(response.data)
            })
            .catch( err => { alert('Error [' + err + ']') })

        
        
        })
        
    }
}