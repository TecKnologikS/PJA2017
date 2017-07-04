package fr.tecknologiks.myapplication.ObjectClass;

/**
 * Created by robinpauquet on 04/07/2017.
 */

public class ResponseAPI {

    private String body;
    private int code;

    public ResponseAPI(int code, String body) {
        this.body = body;
        this.code = code;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
