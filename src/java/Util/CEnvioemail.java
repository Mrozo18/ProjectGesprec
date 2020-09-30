/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;

/**
 *
 * @author melis
 */
public class CEnvioemail {

    Properties propiedad = new Properties();
    private boolean enviado = false;

    public boolean enviarCorreo(String correo, String accion, String parametrocorreo) {

        propiedad.put("mail.smtp.host", "smtp.gmail.com");
        propiedad.put("mail.smtp.starttls.enable", "true");
        propiedad.put("mail.smtp.port", "587");
        propiedad.put("mail.smtp.auth", "true");

        final String emailenvia = "gesprectic@gmail.com";
        final String password = "gesprec123";
        Session sesion = Session.getInstance(propiedad, null);
        String htmlCode;
        MimeMessage mail = new MimeMessage(sesion);
        try {

            mail.setFrom(new InternetAddress(emailenvia));
            // Linea donde se indica a que correo electronico se envia el mensaje
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));

            switch (accion) {
                case "Registro": // Case para recuperacion de cuenta

                    mail.setSubject("CONFIRMACIÓN DE CUENTA.");
                    htmlCode = " <div style=\"background-color: rgb(255, 255, 255); margin-top: auto; width: auto; border-radius: 15px; max-height: 220px; min-height: 220px; text-align: center;\">\n"
                            + "        <img style=\"background-color: rgb(255, 255, 255); border-radius: 15px; margin: 10px;\" src=\"https://1.bp.blogspot.com/-f9SSv_PONpA/X2gaRzf_VgI/AAAAAAAAAAM/GrfsoJ6i5Cw9IaZnyW0tBo0__W6iSbNrgCLcBGAsYHQ/s395/gesprec-large1.png\">\n"
                            + "        <br>\n"
                            // + "        <h4 style=\"color: white; font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \">Hola " + us.getNombres() + "</h4>\n"
                            + "        <h4 style=\"color: black; font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px; \"> Bienvenido a GESPREC, su participación en nuestro sistema es muy importante para nosotros, maneje su informción con total responsabilidad, su contraseña de accseso es:" + parametrocorreo + "</h4>\n"
                            + "    </div>";
                    mail.setContent(htmlCode, "text/html");
                    // mail.setText("Tu codigo de confirmacion es: " + codigo);

                    break;

                case "Recoverypass":

                    mail.setSubject("CONFIRMACION DE CORREO ALTERNATIVO");
                    htmlCode = " <div style=\"background-color: rgb(255, 255, 255); margin-top: auto; width: auto; border-radius: 15px; max-height: 200px; min-height: 210px; text-align: center;\">\n"
                            + "        <img style=\"background-color: rgb(255, 255, 255); border-radius: 15px; margin: 10px;\" src=\"https://1.bp.blogspot.com/-f9SSv_PONpA/X2gaRzf_VgI/AAAAAAAAAAM/GrfsoJ6i5Cw9IaZnyW0tBo0__W6iSbNrgCLcBGAsYHQ/s395/gesprec-large1.png\">\n"
                            + "        <br>\n"
                            + "        <h4 style=\"color: black; font-family: Arial, Helvetica, sans-serif; margin: 10px; margin-top: 10px;\"> Bienvenido a GESPREC, su participación en nuestro sistema es muy importante para nosotros, maneje su informción con total responsabilidad, su codigo de verificación es: " + parametrocorreo + ".</h4>\n"
                            + "     </div>";

                    mail.setContent(htmlCode, "text/html");

                    break;
                default:
                    throw new AssertionError();
            }

            Transport trs = sesion.getTransport("smtp");
            trs.connect(emailenvia, password);
            trs.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
            enviado = true;

        } catch (MessagingException e) {
            System.out.println("Error en el envio del correo " + e);
            Logger.getLogger(CEnvioemail.class.getName()).log(Level.SEVERE, null, e);
        }
        return enviado;
    }

}
