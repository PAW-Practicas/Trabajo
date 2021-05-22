window.addEventListener("load",ej9);



function ej9(){
    var selector=document.querySelectorAll(".fecha");
    setCalendar(selector);
}

function setCalendar(campo) {
  // Configuración del calendario
  let calCnf = {
    dateFormat: "%d/%m/%Y",
    css: "dhx_widget--bordered",
    value: campo.value,
    disabledDates: date => date < new Date()
  }
  let calendar = new dhx.Calendar(null, calCnf); // Creación del calendario
  let popup = new dhx.Popup();                   // Pop-up ...
  popup.attach(calendar);                        // ... asociado al calendario ...
  campo.addEventListener("click", function () {
    popup.show(campo);                           // ...que se muestra al hacer clic en el campo
  });
  calendar.events.on("change", function () {     // Al seleccionar una fecha...
    campo.value = calendar.getValue();           // ... se cambia el valor del campo y ...
    popup.hide();                                // ... se oculta el pop-up/calendario
  });
}