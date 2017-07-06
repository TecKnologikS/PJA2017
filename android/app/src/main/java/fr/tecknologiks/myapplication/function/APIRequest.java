package fr.tecknologiks.myapplication.function;

import android.os.AsyncTask;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.function.Stream;
import fr.tecknologiks.myapplication.interfaceClass.AsyncResponse;

import static fr.tecknologiks.myapplication.ObjectClass.Request.*;

/**
 * Created by robinpauquet on 04/07/2017.
 */

public class APIRequest extends AsyncTask<Void, Void, ResponseAPI> {

    private final String url;
    private final String body;
    private final int type;
    private final int info_sup;
    public AsyncResponse delegate = null;

    public APIRequest(int _type, String _url, String _body, int _info_sup) {
        url = _url;
        body = _body;
        type = _type;
        info_sup = _info_sup;
    }

    @Override
    protected ResponseAPI doInBackground(Void... params) {
        URL url;
        HttpURLConnection urlConnection = null;

        try {
            url = new URL(this.url);
            urlConnection = (HttpURLConnection) url.openConnection();

            switch(type) {
                case GET:
                    break;
                case POST:
                    urlConnection.setRequestMethod("POST");
                    urlConnection.setDoOutput(true);
                    urlConnection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                    OutputStreamWriter wr = new OutputStreamWriter(urlConnection.getOutputStream());
                    wr.write(body);
                    wr.flush();
                    break;
                case PUT:
                    break;
                case DELETE:
                    break;
            }

            int responseCode = urlConnection.getResponseCode();
            if(responseCode == HttpURLConnection.HTTP_OK)
                return new ResponseAPI(responseCode, Stream.readStream(urlConnection.getInputStream()), info_sup);
            return new ResponseAPI(responseCode, "", info_sup);

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ResponseAPI(HttpURLConnection.HTTP_FORBIDDEN, "", info_sup);
    }

    @Override
    protected void onPostExecute(ResponseAPI response) {
        delegate.processFinish(response);
    }

}
