package fr.tecknologiks.myapplication;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TableLayout;
import android.widget.TextView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import fr.tecknologiks.myapplication.ObjectClass.Article;
import fr.tecknologiks.myapplication.ObjectClass.Devis;
import fr.tecknologiks.myapplication.ObjectClass.Request;
import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.ObjectClass.User;
import fr.tecknologiks.myapplication.Param.API;
import fr.tecknologiks.myapplication.adaptateur.ArticlesAdapter;
import fr.tecknologiks.myapplication.adaptateur.DevisAdapter;
import fr.tecknologiks.myapplication.function.APIRequest;
import fr.tecknologiks.myapplication.interfaceClass.AsyncResponse;

/**
 * Created by robinpauquet on 07/07/2017.
 */

public class DevisFragment  extends Fragment implements AsyncResponse {
    public static final String ARG_TITLE = "arg_title";
    private TextView textView;
    private int test = 0;
    ListView lvArticles;
    private ArrayList<Devis> lstDevis = new ArrayList<>();
    DevisAdapter adapter;
    String recherche = "";
    boolean start = false;
    LinearLayout layoutDetails;
    boolean details = false;
    int selected = -1;
    TextView tvSmall;
    TextView tvAbout;
    Button btnAdd;
    Devis devis;
    TableLayout tableDevis;
    EditText edtCount;
    ProgressDialog dialog;
    final int REQUEST_LIST_ARTICLES = 0;
    final int REQUEST_ADD_ARTICLE = 1;
    final int REQUEST_DEVIS = 2;

    final int MENU_RECHERCHE = R.menu.menu_rien;
    final int MENU_DETAILS = R.menu.menu_rien;


    @Override
    public void onResume() {
        super.onResume();
        if(User.getInstance().isCorrect()) {
            if (lstDevis.size() == 0)
                loadDevis();
        }
        if (details && selected > -1)
            showDetails();
    }

    public void showDetails() {
        layoutDetails.setVisibility(View.VISIBLE);
        ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        details = true;((MainActivity2)getActivity()).setTitle("Devis n°" + lstDevis.get(selected).getID());
        tableDevis.removeAllViews();
        LayoutInflater inflater = LayoutInflater.from(getContext());
        View convertView = inflater.inflate(R.layout.adapter_title, null, false);
        tableDevis.addView(convertView);
        /*APIRequest api = new APIRequest(Request.GET, API.Devi(selected), "", REQUEST_DEVIS);
        api.delegate = this;
        api.execute();*/
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_devis, container, false);
        lvArticles = (ListView)rootView.findViewById(R.id.lvArticles);
        layoutDetails = (LinearLayout) rootView.findViewById(R.id.layoutDetails);
        tvSmall = (TextView) rootView.findViewById(R.id.tvsSmallDesc);
        tvAbout = (TextView) rootView.findViewById(R.id.tvAbout);
        btnAdd = (Button) rootView.findViewById(R.id.btnAdd);
        edtCount = (EditText) rootView.findViewById(R.id.edtCount);
        tableDevis = (TableLayout) rootView.findViewById(R.id.containerTable);
        ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        setHasOptionsMenu(true);
        adapter= new DevisAdapter(lstDevis,getContext());
        lvArticles.setAdapter(adapter);
        ((MainActivity2)getActivity()).setMenu(MENU_RECHERCHE);
        lvArticles.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                selected = i;
                showDetails();
            }
        });
        ((MainActivity2)getActivity()).setTitle("Devis");

        return rootView;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                layoutDetails.setVisibility(View.GONE);
                ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                ((MainActivity2)getActivity()).setMenu(MENU_RECHERCHE);
                details = false;
                return true;
        }
        return false;
    }


    private void loadDevis() {
        String req = API.Devis();
        if (recherche.length() > 2)
            req = API.Search(recherche);
        dialog = ProgressDialog.show(getContext(), "",
                "Chargement en cours...", true);
        APIRequest api = new APIRequest(Request.GET, req, "", REQUEST_LIST_ARTICLES);
        api.delegate = DevisFragment.this;
        api.execute();
    }

    @Override
    public void processFinish(ResponseAPI response) {
        if (dialog != null)
            dialog.cancel();
        switch (response.getInfo_sup()) {
            case REQUEST_LIST_ARTICLES:
                lstDevis.clear();
                if (response.getCode() == HttpURLConnection.HTTP_OK) {
                    JsonArray jarray = (new JsonParser().parse(response.getBody())).getAsJsonArray();
                    for (int i = 0; i < jarray.size(); i++) {
                        lstDevis.add(new Devis(jarray.get(i).getAsJsonObject()));
                    }
                }
                adapter.notifyDataSetChanged();

                if (((MainActivity2)getActivity()) != null)
                    if (recherche.length() > 2)
                        ((MainActivity2)getActivity()).setTitle(lstDevis.size() + " Devis");
                    else
                        ((MainActivity2)getActivity()).setTitle("Devis");

                break;
            case REQUEST_DEVIS:
                loadThisDevis(response.getBody());
                break;
        }

    }

    public void loadThisDevis(String response) {

    }

    public void recherche(String _recherche) {
        if (_recherche.length() > 2) {
            recherche = _recherche;
            loadDevis();
        }
    }

    public void annuleRecherche() {
        recherche = "";
        loadDevis();
    }
}