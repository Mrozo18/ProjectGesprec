/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author melis
 */
public class CAcciones {

    // Metodo para crear un json con una lista o un array
    public static String crearListaJson(List lista) {
        JSONArray json = new JSONArray(lista);
        return json.toString();
    }

    // Metodo para crear un json con un objeto
    public static String crearObjetoJson(Object objeto) {
        JSONObject json = new JSONObject(objeto);
        return json.toString();
    }
}
