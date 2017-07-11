package fr.tecknologiks.myapplication;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TableLayout;
import android.widget.TextView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.json.JSONObject;

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

public class DevisFragment  extends Fragment implements AsyncResponse, View.OnClickListener, SubActivity {
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
    String tel;
    String email;
    String adresse;
    AlertDialog actionsDialog;
    TableLayout tableDevis;
    TableLayout tableArticles;
    TableLayout tablePromos;
    TableLayout tableRecap;
    EditText edtCount;
    ProgressDialog dialog;
    final int REQUEST_LIST_ARTICLES = 0;
    final int REQUEST_ADD_ARTICLE = 1;
    final int REQUEST_DEVIS = 2;

    LayoutInflater inflater;
    final int MENU_RECHERCHE = R.menu.menu_rien;
    final int MENU_DETAILS = R.menu.menu_devis_details;


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
        dialog = ProgressDialog.show(getContext(), "",
                "Chargement en cours...", true);
        APIRequest api = new APIRequest(Request.GET, API.Devi(lstDevis.get(selected).getID()), "", REQUEST_DEVIS);
        api.delegate = this;
        api.execute();
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
        tableDevis = (TableLayout) rootView.findViewById(R.id.tableDevis);
        tableArticles = (TableLayout) rootView.findViewById(R.id.tableArticles);
        tablePromos = (TableLayout) rootView.findViewById(R.id.tablePromos);
        tableRecap = (TableLayout) rootView.findViewById(R.id.tableRecap);
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
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(getContext());
        inflater = LayoutInflater.from(getContext());
        View dialogView = inflater.inflate(R.layout.alert_action, null);
        ((ImageButton)dialogView.findViewById(R.id.btnAppel)).setOnClickListener(this);
        ((ImageButton)dialogView.findViewById(R.id.btnMail)).setOnClickListener(this);
        ((ImageButton)dialogView.findViewById(R.id.btnAdresse)).setOnClickListener(this);
        ((ImageButton)dialogView.findViewById(R.id.btnCancel)).setOnClickListener(this);
        dialogBuilder.setView(dialogView);

        actionsDialog = dialogBuilder.create();
        ((MainActivity2)getActivity()).setTitle("Devis");

        return rootView;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        dialog.dismiss();
        switch (item.getItemId()) {
            case android.R.id.home:
                unshowDetails();
                return true;

            case R.id.export:
                if (!actionsDialog.isShowing())
                    actionsDialog.show();
                break;
        }

        return false;
    }

    public void unshowDetails() {
        layoutDetails.setVisibility(View.GONE);
        ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        ((MainActivity2)getActivity()).setMenu(MENU_RECHERCHE);
        details = false;
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
                if (response.getCode() == HttpURLConnection.HTTP_OK) {
                    JsonObject json = (new JsonParser().parse(response.getBody())).getAsJsonObject();
                    loadThisDevis(json);
                }
                break;
        }

    }

    public void ifExist(JsonObject json, String name, String libelle, TableLayout table) {
        if (json.has(name) && !json.get(name).isJsonNull())
            addTitleValue(table, libelle, json.get(name).getAsString());
    }

    public void addTitle(TableLayout table, String libelle) {
        View convertView = inflater.inflate(R.layout.adapter_title, null, false);
        ((TextView)convertView.findViewById(R.id.tvTitle)).setText(libelle);
        table.addView(convertView);
    }

    public void addTitleValue(TableLayout table, String libelle, String values) {
        View convertView = inflater.inflate(R.layout.adapter_libelle_value, null, false);
        ((TextView)convertView.findViewById(R.id.tvLibelle)).setText(libelle);
        ((TextView)convertView.findViewById(R.id.tvValue)).setText(values);
        table.addView(convertView);
    }

    public void addArticles(TableLayout table, String libelle, String values) {
        View convertView = inflater.inflate(R.layout.adapter_article_table, null, false);
        ((TextView)convertView.findViewById(R.id.tvLibelle)).setText(libelle);
        ((TextView)convertView.findViewById(R.id.tvValue)).setText(values);
        table.addView(convertView);
    }

    public void loadThisDevis(JsonObject json) {

        tableDevis.removeAllViews();
        tableArticles.removeAllViews();
        tablePromos.removeAllViews();
        tableRecap.removeAllViews();

        ((MainActivity2)getActivity()).setMenu(MENU_DETAILS);

        inflater = LayoutInflater.from(getContext());
        addTitle(tableDevis, "Informations");
        JsonObject devis = json.get("devis").getAsJsonObject();
        ifExist(devis, "Societe",        "Société",     tableDevis);
        ifExist(devis, "Nom",            "Nom",         tableDevis);
        ifExist(devis, "Prenom",         "Prenom",      tableDevis);
        ifExist(devis, "Date_Creation",  "Création",    tableDevis);
        ifExist(devis, "Date_Validity",  "Validité",    tableDevis);
        ifExist(devis, "Siret",          "Siret",       tableDevis);
        ifExist(devis, "Tel",            "Tel",         tableDevis);
        ifExist(devis, "Fax",            "Fax",         tableDevis);
        ifExist(devis, "Email",          "Email",       tableDevis);
        ifExist(devis, "Adresse",        "Adresse",     tableDevis);
        ifExist(devis, "CP",             "CP",          tableDevis);
        ifExist(devis, "Ville",          "Ville",       tableDevis);

        if (!devis.get("Tel").isJsonNull())
            this.tel = devis.get("Tel").getAsString();
        if (!devis.get("Email").isJsonNull())
            this.email = devis.get("Email").getAsString();
        if (!devis.get("Adresse").isJsonNull() || !devis.get("CP").isJsonNull() || !devis.get("Ville").isJsonNull())
            this.adresse = devis.get("Adresse").getAsString() + " " + devis.get("CP").getAsString() + " " + devis.get("Ville").getAsString();

        addTitle(tableArticles, "Articles");
        JsonArray articles = json.get("articles").getAsJsonArray();
        for(int i = 0; i < articles.size(); i++) {
            JsonObject article = articles.get(i).getAsJsonObject();
            addArticles(tableArticles, article.get("name").getAsString() + " (x" + article.get("Qte").getAsString() + ")", article.get("Prix_final").getAsString() + " €");
        }

        JsonArray promos = json.get("promo").getAsJsonArray();
        if (promos.size() > 0) {
            addTitle(tablePromos, "Promotion");
            for(int i = 0; i < promos.size(); i++) {
                JsonObject promo = promos.get(i).getAsJsonObject();
                addTitleValue(tablePromos, promo.get("Nom").getAsString(), promo.get("Code").getAsString());
            }
        }


        addTitle(tableRecap, "Récapitulatif");
        addTitleValue(tableRecap, "Prix",           devis.get("Prix").getAsString() + " €");
        addTitleValue(tableRecap, "Réduction",      devis.get("Reduction").getAsString() + " €");
        addTitleValue(tableRecap, "Prix final",     devis.get("Prix_final").getAsString() + " €");
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

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.btnCancel:
                if (actionsDialog != null) {
                    actionsDialog.dismiss();
                }
                break;
            case R.id.btnAdresse:
                if (adresse.trim().length() > 3) {
                    Intent mapIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("geo:0,0?q=" + adresse));
                    mapIntent.setPackage("com.google.android.apps.maps");
                    startActivity(mapIntent);
                }
                break;
            case R.id.btnMail:
                if (email.trim().length() > 3 &&  email.contains("@")) {
                    final Intent emailIntent = new Intent(android.content.Intent.ACTION_SEND);
                    emailIntent.setType("plain/text");
                    emailIntent.putExtra(android.content.Intent.EXTRA_EMAIL, new String[]{email});
                    emailIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, "WebApp Commercial");
                    startActivity(Intent.createChooser(emailIntent, "Envoi courriel..."));
                }
                break;
            case R.id.btnAppel:
                if (tel.trim().length() > 3)
                    startActivity(new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + tel)));
                break;
        }
    }

    @Override
    public void onBackPressed() {
        if (!details) {
            new AlertDialog.Builder(getContext())
                    .setMessage("Voulez vous vraiment quitter ?")
                    .setCancelable(false)
                    .setPositiveButton("Oui", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int id) {
                            ((MainActivity2)getActivity()).finish();
                        }
                    })
                    .setNegativeButton("Non", null)
                    .show();
        } else {
            unshowDetails();
        }
    }
}