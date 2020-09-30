// Funcíon para validar solo letras
function validateText(parametro) {
    var patron = /^[a-zA-ZáéíóúÁÉÍÓÚ\s]*$/;
    if (parametro.search(patron)) {
        return false;
    } else {
        return true;
    }
}
// --------------------------------

//Funcion para validar espacios en blanco
function validateSpaces(parametro) {
    var patron = /^\s+$/;
    if (patron.test(parametro)) {
        return false;
    } else {
        return true;
    }
}
//---------------------------------------


function validateForm() {
    var form = document.addForm;   
    var name = document.getElementById("name").value;
    var last_name = document.getElementById("last_name").value;
    var pass =  document.getElementById("pass").value;
    var confirmpass =  document.getElementById("confirmpass").value;

//Validar campo nombre
    if (form.name.value === "" || validateSpaces(form.name.value) === false) {
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar nombre.</div>';
        form.name.value = "";
        form.name.focus();
        return false;
    } else if (validateText(form.name.value) === false) {
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permiten valores númericos en el nombre.</div>';
        form.name.value = "";
        form.name.focus();
        return false;
    } else if (name.length > 30) {
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar un nombre no tan largo.</div>';
        form.name.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }


//Validar campo apellido
    if (form.last_name.value === "" || validateSpaces(form.last_name.value) === false) {
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar apellido.</div>';
        form.last_name.value = "";
        form.last_name.focus();
        return false;
    } else if (validateText(form.last_name.value) === false) {
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permiten valores númericos en el apellido.</div>';
        form.last_name.value = "";
        form.last_name.focus();
        return false;
    } else if (last_name > 30) {
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar un apellido no tan largo.</div>';
        form.last_name.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }
//Validar que contraseña y confirmar contraseña sean iguales
    if (form.pass.value !== form.confirmpass.value){
        document.getElementById("alerta").innerHTML = ' <div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Contraseñas ingresadas no son iguales.</div>';
        form.pass.value = "";
        form.confirmpass.value = "";
        form.pass.focus();
        return false;
    } else{
        document.getElementById("alerta").innerHTML = "";
    }
    form.submit();
}

