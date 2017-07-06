package fr.tecknologiks.myapplication;

import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.SearchView;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import java.net.HttpURLConnection;
import java.util.ArrayList;

import fr.tecknologiks.myapplication.ObjectClass.Article;
import fr.tecknologiks.myapplication.ObjectClass.Panier;
import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.ObjectClass.User;
import fr.tecknologiks.myapplication.Param.API;
import fr.tecknologiks.myapplication.adaptateur.ArticlesAdapter;
import fr.tecknologiks.myapplication.adaptateur.PanierAdapter;
import fr.tecknologiks.myapplication.function.APIRequest;
import fr.tecknologiks.myapplication.interfaceClass.AsyncResponse;

public class MainActivity extends AppCompatActivity implements AsyncResponse {

    final int ZONE_ARTICLE = 10;
    final int ART_LIST = 11;
    final int ART_RECHERCHE = 12;
    final int ART_DETAILS = 13;

    final int ZONE_PANIER = 20;
    final int PAN_LIST = 21;
    final int PAN_ADDITION = 22;
    final int PAN_VALIDATE = 23;

    final int ZONE_DEVIS = 30;
    final int DEV_LIST = 31;
    final int DEV_DETAILS = 32;

    private int affichage = ZONE_ARTICLE;
    private int affichage_art = ART_LIST;
    private int affichage_pan = PAN_LIST;
    private int affichage_dev = DEV_LIST;

    String recherche = "";
    private boolean block = false;
    private ArrayList<Article> lstArticles = new ArrayList<>();
    ListView lvArticles;
    ListView lvPanier;
    ListView lvDevis;
    ArticlesAdapter adapter;
    PanierAdapter adapterPanier;
    SearchView searchView;



    private void updateView() {
        if (!User.getInstance().isCorrect()) {
            startActivity(new Intent(this, LoginActivity.class));
        } else {
            switch (affichage) {
                case ZONE_ARTICLE:
                    updateViewDetails(affichage_art);
                    break;
                case ZONE_PANIER:
                    updateViewDetails(affichage_pan);
                    break;
                case ZONE_DEVIS:
                    updateViewDetails(affichage_dev);
                    break;
            }
        }
    }

    private void updateViewDetails(int etat) {
        lvArticles.setVisibility(View.GONE);
        lvPanier.setVisibility(View.GONE);
        lvDevis.setVisibility(View.GONE);

        switch (etat) {
            case ART_LIST:
                lvArticles.setVisibility(View.VISIBLE);
                recherche = "";
                searchView.onActionViewCollapsed();
                loadArticles();
                break;
            case ART_RECHERCHE:
                lvArticles.setVisibility(View.VISIBLE);
                searchView.onActionViewExpanded();
                searchView.setQuery(recherche, false);
                loadArticles();
                break;
            case ART_DETAILS:
                break;
            case PAN_LIST:
                lvPanier.setVisibility(View.VISIBLE);
                loadPanier();
                break;
            case PAN_ADDITION:
                break;
            case PAN_VALIDATE:
                break;
            case DEV_LIST:
                lvDevis.setVisibility(View.VISIBLE);
                break;
            case DEV_DETAILS:
                break;


        }

    }

    private void previousView() {
        switch(affichage) {
            case ZONE_ARTICLE:
                switch(affichage_art) {
                    case ART_DETAILS:
                        if (recherche.length() > 2) {
                            affichage_art = ART_RECHERCHE;
                        } else {
                            affichage_art = ART_LIST;
                        }
                        break;
                    case ART_RECHERCHE:
                        recherche = "";
                        affichage_art = ART_LIST;
                        break;
                }
                break;
        }
        updateView();
    }

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            if (!block){
                switch (item.getItemId()) {
                    case R.id.navigation_home:
                        if (affichage == ZONE_ARTICLE) {
                            previousView();
                        } else {
                            affichage = ZONE_ARTICLE;
                            updateView();
                        }
                        return true;
                    case R.id.navigation_dashboard:
                        affichage = ZONE_PANIER;
                        updateView();
                        //mTextMessage.setText(R.string.title_dashboard);
                        return true;
                    case R.id.navigation_notifications:
                        loadDevis();
                        //mTextMessage.setText(R.string.title_notifications);
                        return true;
                }
            }
            return false;
        }

    };

    @Override
    protected void onResume() {
        super.onResume();
        updateView();
    }

    private void loadArticles() {
        block = true;
        String req = API.Articles();
        if (recherche.length() > 2)
            req = API.Search(recherche);
        APIRequest api = new APIRequest(1, req, "", 0);
        api.delegate = MainActivity.this;
        api.execute();
    }

    private void loadPanier() {
        block = true;
        APIRequest api = new APIRequest(1, API.Panier(), "", 0);
        api.delegate = MainActivity.this;
        api.execute();

        this.getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    private void loadDevis() {
       // block = true;

    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        lvArticles = (ListView)findViewById(R.id.lvArticles);
        lvPanier = (ListView)findViewById(R.id.lvPanier);
        lvDevis = (ListView)findViewById(R.id.lvDevis);
        //mTextMessage = (TextView) findViewById(R.id.message);
        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);

        adapter= new ArticlesAdapter(lstArticles,getApplicationContext());
       // adapterPanier= new PanierAdapter(Panier.getInstance().getArticles(),getApplicationContext(), this);

        lvArticles.setAdapter(adapter);
        lvPanier.setAdapter(adapterPanier);

        lvArticles.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Article dataModel= lstArticles.get(position);

                Snackbar.make(view, dataModel.getName()+"\n"+dataModel.getPrix()+" API: "+dataModel.getName(), Snackbar.LENGTH_LONG)
                        .setAction("No action", null).show();
            }
        });




    }

    @Override
    public void processFinish(ResponseAPI response) {
        switch(affichage) {
            case ZONE_ARTICLE:
                lstArticles.clear();
                if (response.getCode() == HttpURLConnection.HTTP_OK) {
                    JsonArray jarray = (new JsonParser().parse(response.getBody())).getAsJsonArray();
                    for (int i = 0; i < jarray.size(); i++) {
                        lstArticles.add(new Article(jarray.get(i).getAsJsonObject()));
                    }
                }
                adapter.notifyDataSetChanged();
                setTitle("Articles");
                if (recherche.length() > 2)
                    setTitle(lstArticles.size() + " Articles");

                break;
            case ZONE_PANIER:
                if (response.getCode() == HttpURLConnection.HTTP_OK)
                    Panier.getInstance().fromJSON(response.getBody());
                adapterPanier.notifyDataSetChanged();
                setTitle("Panier (" + Panier.getInstance().getPrix_final() + " €)");
                break;
        }


        block = false;
        invalidateOptionsMenu();
       // adapter.notifyDataSetChanged();
       /* JsonElement jelement = new JsonParser().parse(json);
        JsonArray array = jelement.getAsJsonArray();
        JsonObject jobject = jelement.getAsJsonObject();
        if (jobject.size() > 0) {
            this.id = jobject.get("ID").getAsInt();
            this.name = jobject.get("login").getAsString();
            this.token = jobject.get("token").getAsString();
        }*/
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        switch (affichage) {
            case ZONE_ARTICLE:
                inflater.inflate(R.menu.menu_top, menu);
                SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
                searchView = (SearchView) menu.findItem(R.id.search).getActionView();
                searchView.setSearchableInfo(searchManager.getSearchableInfo(getComponentName()));
                break;
            case ZONE_PANIER:
                break;
        }


        return true;
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == android.R.id.home) {
            previousView();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onNewIntent(Intent intent) {
         handleIntent(intent);
    }

    private void handleIntent(Intent intent) {

        if (Intent.ACTION_SEARCH.equals(intent.getAction())) {
            affichage_art = ART_RECHERCHE;
            recherche = intent.getStringExtra(SearchManager.QUERY);
            updateView();
        }
    }
}
