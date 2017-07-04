package fr.tecknologiks.myapplication.function;

import android.os.AsyncTask;
import android.util.Log;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import fr.tecknologiks.myapplication.ObjectClass.Request;
import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.ObjectClass.User;
import fr.tecknologiks.myapplication.R;
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
    public AsyncResponse delegate = null;

    public APIRequest(int _type, String _url, String _body) {
        url = _url;
        body = _body;
        type = _type;
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
                return new ResponseAPI(responseCode, Stream.readStream(urlConnection.getInputStream()));
            return new ResponseAPI(responseCode, "");

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ResponseAPI(HttpURLConnection.HTTP_FORBIDDEN, "");
    }

    @Override
    protected void onPostExecute(ResponseAPI response) {
        delegate.processFinish(response);
    }

}
