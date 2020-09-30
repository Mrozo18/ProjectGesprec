//Función para validar texto
function validateText(parametro) {
    var patron = /^[a-zA-ZáéíóúÁÉÍÓÚ\s]*$/;
    if (parametro.search(patron)) {
        return false;
    } else {
        return true;
    }
}
//Fin

//Función para validar correo
function validateEmail(parametro) {
    var patron = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3,4})+$/;
    //var patron = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (patron.test(parametro)) {
        return false;
    } else {
        return true;
    }
}
//Fin
function validateForm() {
    var formulario = document.addForm;
    //Validaciones del nombre
    if (formulario.name.value == "") {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar nombre.</div>';
        formulario.name.focus();
        return false;
    } else if (validateText(formulario.name.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permiten valores númericos en el nombre.</div>';
        formulario.name.value = "";
        formulario.name.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }
    //Validaciones del apellido
    if (formulario.Apellido.value == "") {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar apellido.</div>';
        formulario.Apellido.focus();
        return false;
    } else if (validateText(formulario.Apellido.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permiten valores númericos en el apellido.</div>';
        formulario.Apellido.value = "";
        formulario.Apellido.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }
    //Validaciones del telefono
    if (formulario.Telefono.value == "") {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar un teléfono.</div>';
        formulario.Telefono.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }
    //Validaciones del correo
    if (formulario.email.value == "") {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar el email.</div>';
        formulario.email.focus();
        return false;
    } else if (validateEmail(formulario.email.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar un email valido.</div>';
        formulario.email.value = "";
        formulario.email.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }
    formulario.submit();
}


