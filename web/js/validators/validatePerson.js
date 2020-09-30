//Función para validar texto
function validarTexto(parametro) {
    var patron = /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]*$/;
    if (parametro.search(patron)) {
        return false;
    } else {
        return true;
    }
}
//Fin texto

//Función para validar solo números
function validarNumeros(parametro) {
    if (!/^([0-9])*$/.test(parametro)) {
        return false;
    } else {
        return true;
    }
}
//Fun números

//Función para validar correo
function validarCorreo(parametro) {
    var patron = /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/;
    if (patron.test(parametro)) {
        return false;
    } else {
        return true;
    }
}
//Fin correo

//Función para validar télefono
function validarTelefino(parametro) {
    var patron = /^9\d{3}-\d{3}-\d{4}$/; //000-000-0000
    if (!patron.test(parametro)) {
        return false;
    } else {
        return true;
    }

}
//Fin télefono

//Función para validar espacios en blanco
function validarEspacios(parametro) {
    var patron = /^\s+$/;
    if (patron.test(parametro)) {
        return false;
    } else {
        return true;
    }
}
//fin espacios en blanco

//Función para validar carácteres
function validarLongitud(parametro) {
    if (parametro.length < 11) {
        return false;
    } else {
        return true;
    }
}
//Fin carácteres

function validateForm() {
    var formulario = document.addFormPerson;

    /*Validaciones campo cédula*/
    if (formulario.Id_user.value == "" || validarEspacios(formulario.Id_user.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar cédula</div>';
        formulario.Id_user.value = "";
        formulario.Id_user.focus();
        return false;
    } else if (validarNumeros(formulario.Id_user) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar solo valores númericos a cédula</div>';
        formulario.Id_user.value = "";
        formulario.Id_user.focus();
        return false;
    } else if (validarLongitud(formulario.Id_user.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar cédula completa</div>';
        formulario.Id_user.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }

    /*Validaciones campo nombre*/
    if (formulario.name.value == "" || validarEspacios(formulario.name.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar nombre</div>';
        formulario.name.value = "";
        formulario.name.focus();
        return false;
    } else if (validarTexto(formulario.name) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permiten valores númericos en el campo nombre</div>';
        formulario.name.value = "";
        formulario.name.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }

    /*Validaciones campo apellido*/
    if (formulario.Apellido.value == "" || validarEspacios(formulario.Apellido.value) == false) {
        formulario.Apellido.value = "";
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar apellido</div>';
        formulario.Apellido.focus();
        return false;
    } else if (validarTexto(formulario.Apellido) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>No se permiten valores númericos en el campo apellido</div>';
        formulario.Apellido.value = "";
        formulario.Apellido.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }

    /*Validaciones campo teléfono*/
    if (formulario.Telefono.value == "" || validarEspacios(formulario.Telefono.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar teléfono</div>';
        formulario.Telefono.value = "";
        formulario.Telefono.focus();
        return false;
    } else if (validarNumeros(formulario.Telefono) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar solo valores númericos a celular</div>';
        formulario.Telefono.value = "";
        formulario.Telefono.focus();
        return false;
    } else if (validarTelefono(formulario.Telefono.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Número de teléfono ingresado no es válido.</div>';
        formulario.Telefono.value = "";
        formulario.Telefono.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }


    /*Validaciones campo email*/
    if (formulario.email.value == "" || validarEspacios(formulario.email.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar correo</div>';
        formulario.email.value = "";
        formulario.email.focus();
        return false;
    } else if (validarCorreo(formulario.email.value) == false) {
        document.getElementById("alerta").innerHTML = '<div class="alert alert-danger"><a href="" class="close" data-dismiss="alert">&times;</a>Favor ingresar un correo valido</div>';
        formulario.email.value = "";
        formulario.email.focus();
        return false;
    } else {
        document.getElementById("alerta").innerHTML = "";
    }

    formulario.submit();

}

