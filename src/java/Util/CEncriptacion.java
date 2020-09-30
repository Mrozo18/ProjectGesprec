/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author melis
 */
public class CEncriptacion {
      // Encriptar contraseñas
    public static String encriptar(String staencrypt) {

        String secretKey = "l9kdfs8Jkd75EryS6sS32ju6"; //llave para encriptar debe ser igual a la de desencriptar
        String encrypt = "";

        try {

            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
            byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);

            SecretKey key = new SecretKeySpec(keyBytes, "DESede");
            Cipher cipher = Cipher.getInstance("DESede");
            cipher.init(Cipher.ENCRYPT_MODE, key);

            byte[] plainTextBytes = staencrypt.getBytes("utf-8");
            byte[] buf = cipher.doFinal(plainTextBytes);
            // byte[] base64Bytes = Base64.encodeBase64(buf);
            byte[] base64Bytes = Base64.getEncoder().encode(buf);
            encrypt = new String(base64Bytes);

        } catch (UnsupportedEncodingException | InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException ex) {
            System.out.println("Error al encriptar la cadena" + ex);
            Logger.getLogger(CEncriptacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return encrypt;
    }
    
    public static String desencriptar(String stencrypt) {

        String secretKey = "l9kdfs8Jkd75EryS6sS32ju6"; // LLave para desencriptar debe ser igual a la de encriptar
        String desencrypt;

        try {
            //byte[] message = Base64.decodeBase64(textoEncriptado.getBytes("utf-8"));
            byte[] message = Base64.getDecoder().decode(stencrypt.getBytes("utf-8"));

            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
            byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
            SecretKey key = new SecretKeySpec(keyBytes, "DESede");

            Cipher decipher = Cipher.getInstance("DESede");
            decipher.init(Cipher.DECRYPT_MODE, key);

            byte[] plainText = decipher.doFinal(message);

            desencrypt = new String(plainText, "UTF-8");

        } catch (UnsupportedEncodingException | InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException ex) {
            System.out.println("Error al desencriptar la cadena " + ex);
            Logger.getLogger(CEncriptacion.class.getName()).log(Level.SEVERE, null, ex);
            desencrypt = "Error";
        }
        return desencrypt;
    }
}
