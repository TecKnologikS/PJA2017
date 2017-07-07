package fr.tecknologiks.myapplication;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;

import java.net.HttpURLConnection;
import java.util.HashMap;

import fr.tecknologiks.myapplication.ObjectClass.Panier;
import fr.tecknologiks.myapplication.ObjectClass.Request;
import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.Param.API;
import fr.tecknologiks.myapplication.adaptateur.ArticlesAdapter;
import fr.tecknologiks.myapplication.adaptateur.PanierAdapter;
import fr.tecknologiks.myapplication.function.APIRequest;
import fr.tecknologiks.myapplication.function.Message;
import fr.tecknologiks.myapplication.interfaceClass.AsyncResponse;

/**
 * Created by robinpauquet on 05/07/2017.
 */


public class PanierFragment extends Fragment implements PanierAdapter.PanierListener, AsyncResponse {
    public static final String ARG_TITLE = "arg_title";
    final int ETAT_PANIER = 0;
    final int ETAT_ADDITION = 1;
    final int ETAT_VALIDATE = 2;
    private int etat = ETAT_PANIER;
    ListView lvPanier;
    PanierAdapter adapter;
    final int REQUEST_LOAD = 0;
    final int REQUEST_SUPPR = 1;
    final int REQUEST_UPDATE = 2;
    final int REQUEST_PROMO = 3;

    final int MENU_PANIER = R.menu.menu_panier;
    final int MENU_ADDITION_ = R.menu.menu_addition;
    final int MENU_VALIDATE = R.menu.menu_validate;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_panier, container, false);
        lvPanier = (ListView)rootView.findViewById(R.id.lvPanier);
        adapter = new PanierAdapter(Panier.getInstance().getArticles(), getContext(), this);
        lvPanier.setAdapter(adapter);
        setHasOptionsMenu(true);
        ((MainActivity2)getActivity()).setMenu(MENU_PANIER);
        ((MainActivity2)getActivity()).setTitle("Panier (" + Panier.getInstance().getPrix_final() + " €)");
        //((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);

        return rootView;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                return true;
        }
        return false;
    }

    @Override
    public void onSuppr(final int position) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setMessage("Supprimer cet article ?")
                .setPositiveButton("Je confirme", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        HashMap<String, String> dict = new HashMap<String, String>();
                        dict.put("id", String.valueOf(Panier.getInstance().getArticles().get(position).getId()));
                        String test = new Gson().toJson(dict);
                        APIRequest api = new APIRequest(Request.POST, API.RemoveToBasket(), test, REQUEST_UPDATE);
                        api.delegate = PanierFragment.this;
                        api.execute();
                    }
                })
                .setNegativeButton("Annuler", null);
        builder.create().show();
    }

    @Override
    public void onUpdate(int position, int qte) {
        HashMap<String, String> dict = new HashMap<String, String>();
        dict.put("id", String.valueOf(Panier.getInstance().getArticles().get(position).getId()));
        dict.put("qte", String.valueOf(qte));
        String test = new Gson().toJson(dict);
        APIRequest api = new APIRequest(Request.POST, API.UpdateToBasket(), test, REQUEST_UPDATE);
        api.delegate = PanierFragment.this;
        api.execute();
    }

    @Override
    public void processFinish(ResponseAPI response) {
        switch (response.getInfo_sup()) {
            case REQUEST_UPDATE:
            case REQUEST_SUPPR:
                updatePanier();
                break;
            case REQUEST_LOAD:
                if (response.getCode() == HttpURLConnection.HTTP_OK) {
                    Panier.getInstance().fromJSON(response.getBody());
                    adapter.notifyDataSetChanged();
                    ((MainActivity2)getActivity()).setTitle("Panier (" + Panier.getInstance().getPrix_final() + " €)");
                }
                break;
        }
    }

    public void updatePanier() {
        APIRequest api = new APIRequest(Request.GET, API.Panier(), "", 0);
        api.delegate = PanierFragment.this;
        api.execute();
    }
}