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
                    <br><h2 class="active"> Actualizar contraseña </h2>
                </div>
                <form action="validar?accion=Updatepass" method="post" class="mb-2">

                    <input type="password" id="pass" class="fadeIn second" name="pass" placeholder="Contraseña nueva">
                    <input type="password" id="passconfirm" class="fadeIn third" name="passconfirm" placeholder="Repetir contraseña nueva">
                    <div class="mb-2">
                        <span class="text-danger" style="color: #18b16f">${alert}</span>
                    </div>
                    <div class="mb-2">
                        <span class="text-danger">${html}</span>
                    </div>
                    <input type="submit" name="accion" class="fadeIn fourth" value="Actualizar">
                </form>

            </div>
        </div>

    </body>
</html>


