

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es" >
    <head>
        <meta charset="UTF-8">
        <title>Sesion</title>
        <link rel="stylesheet" href="css/sesion.css">
        <link rel="icon" type="image/png" href="img/logo.png">

    </head>
    <body>
        <!-- partial:index.partial.html -->
        <br><br><div class="wrapper fadeInDown">
            <div id="formContent">
                <div class="fadeIn first">
                    <img src="img/logo.png" id="icon" alt="User Icon" />
                    <br><h2 class="active"> Ingrese usuario</h2>
                </div>
                <form action="validar" method="post">
                    <input type="text" id="usuario" class="fadeIn third" name="usuario" placeholder="Usuario">
                    <div class="mb-2">
                        <span class="" style="color: red">${alert}</span>
                    </div>
                    <input type="submit" name="accion" class="fadeIn fourth" value="Confirmar">
                </form>
            </div>
        </div>
    </body>
</html>


