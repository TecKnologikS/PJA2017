package fr.tecknologiks.myapplication.ObjectClass;

/**
 * Created by robinpauquet on 04/07/2017.
 */

public class ResponseAPI {

    private String body;
    private int code;
    private int info_sup;

    public ResponseAPI(int code, String body, int info_sup) {
        this.body = body;
        this.code = code;
        this.info_sup = info_sup;
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

    public int getInfo_sup() {
        return info_sup;
    }

    public void setInfo_sup(int info_sup) {
        this.info_sup = info_sup;
    }
}
