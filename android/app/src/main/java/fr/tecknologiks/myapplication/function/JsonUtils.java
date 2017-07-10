package fr.tecknologiks.myapplication.function;

import com.google.gson.JsonObject;

import org.json.JSONObject;

/**
 * Created by robinpauquet on 10/07/2017.
 */

public class JsonUtils {

    public static String ifExistString(JsonObject json, String name) {
        return (json.has(name) && !json.get(name).isJsonNull()) ? json.get(name).getAsString() : "";
    }

}
