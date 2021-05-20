window.addEventListener("load", ej8);

function ej8() {


    var a = document.querySelectorAll(".item");
    
    
    document.querySelectorAll(".item").forEach(x => {
        x.addEventListener("dragstart", function (e) {
            var enlace=e.currentTarget.querySelector('.carro a').href;
            e.dataTransfer.setData('enlace',enlace);
        });
    });
    
    var carro=document.getElementById("carroDrop");
    carro.addEventListener("dragover",function(e){
        e.preventDefault();       
    });
    carro.addEventListener("drop",function(e){
        var enlace=e.dataTransfer.getData('enlace')    ;
        window.location=enlace;
    });

}