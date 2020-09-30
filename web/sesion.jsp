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
                    <br><h2 class="active"> Iniciar Sesión </h2>
                </div>

                <form action="validar" method="post" class="mb-2">
                    <input type="text" id="username" class="fadeIn second" name="usuario" placeholder="Usuario">
                    <input type="password" id="pwd" class="fadeIn third" name="pass" placeholder="Contraseña">
                    <input type="submit" name="accion" class="fadeIn fourth" value="Ingresar">
                </form>
                <div class="text-right">
                    <a href="recoverypass.jsp">Olvide mi contraseña</a>
                </div>
            </div>
        </div>
        <!-- partial -->

    </body>
</html>

