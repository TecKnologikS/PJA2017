package fr.tecknologiks.myapplication;

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
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import fr.tecknologiks.myapplication.ObjectClass.Article;
import fr.tecknologiks.myapplication.ObjectClass.Panier;
import fr.tecknologiks.myapplication.ObjectClass.Request;
import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.ObjectClass.User;
import fr.tecknologiks.myapplication.Param.API;
import fr.tecknologiks.myapplication.adaptateur.ArticlesAdapter;
import fr.tecknologiks.myapplication.adaptateur.PanierAdapter;
import fr.tecknologiks.myapplication.function.APIRequest;
import fr.tecknologiks.myapplication.interfaceClass.AsyncResponse;

/**
 * Created by robinpauquet on 05/07/2017.
 */

public class ArticleFragment extends Fragment implements AsyncResponse {
    public static final String ARG_TITLE = "arg_title";
    private TextView textView;
    private int test = 0;
    ListView lvArticles;
    private ArrayList<Article> lstArticles = new ArrayList<>();
    ArticlesAdapter adapter;
    String recherche = "";
    boolean start = false;
    LinearLayout layoutDetails;
    boolean details = false;
    int selected = -1;
    TextView tvSmall;
    TextView tvAbout;
    Button btnAdd;
    EditText edtCount;
    final int REQUEST_LIST_ARTICLES = 0;
    final int REQUEST_ADD_ARTICLE = 1;


    @Override
    public void onResume() {
        super.onResume();
        if(User.getInstance().isCorrect()) {
            if (lstArticles.size() == 0)
                loadArticles();
        }
        if (details && selected > -1)
            showDetails();
    }

    public void showDetails() {
        layoutDetails.setVisibility(View.VISIBLE);
        ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        details = true;
        ((MainActivity2)getActivity()).setTitle("" + lstArticles.get(selected).getName());
        tvSmall.setText(lstArticles.get(selected).getSmallDesc());
        tvSmall.setText(lstArticles.get(selected).getAbout());
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_article, container, false);
        lvArticles = (ListView)rootView.findViewById(R.id.lvArticles);
        layoutDetails = (LinearLayout) rootView.findViewById(R.id.layoutDetails);
        tvSmall = (TextView) rootView.findViewById(R.id.tvsSmallDesc);
        tvAbout = (TextView) rootView.findViewById(R.id.tvAbout);
        btnAdd = (Button) rootView.findViewById(R.id.btnAdd);
        edtCount = (EditText) rootView.findViewById(R.id.edtCount);
        ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        setHasOptionsMenu(true);
        adapter= new ArticlesAdapter(lstArticles,getContext());
        lvArticles.setAdapter(adapter);
        lvArticles.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                selected = i;
                showDetails();
            }
        });
        ((MainActivity2)getActivity()).setTitle("Articles");
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(Integer.parseInt(edtCount.getText().toString()) > 0) {
                    HashMap<String, String> dict = new HashMap<String, String>();
                    dict.put("id", String.valueOf(lstArticles.get(selected).getId()));
                    dict.put("nb", edtCount.getText().toString());
                    String test = new Gson().toJson(dict);
                    APIRequest api = new APIRequest(Request.POST, API.AddArticle(), test, REQUEST_ADD_ARTICLE);
                    api.delegate = ArticleFragment.this;
                    api.execute();
                } else {
                    //todo: error
                }
            }
        });
        return rootView;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                layoutDetails.setVisibility(View.GONE);
                ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                details = false;
                return true;
        }
        return false;
    }


    private void loadArticles() {
        String req = API.Articles();
        if (recherche.length() > 2)
            req = API.Search(recherche);
        APIRequest api = new APIRequest(Request.GET, req, "", REQUEST_LIST_ARTICLES);
        api.delegate = ArticleFragment.this;
        api.execute();
    }

    @Override
    public void processFinish(ResponseAPI response) {
        switch (response.getInfo_sup()) {
            case REQUEST_LIST_ARTICLES:
                lstArticles.clear();
                if (response.getCode() == HttpURLConnection.HTTP_OK) {
                    JsonArray jarray = (new JsonParser().parse(response.getBody())).getAsJsonArray();
                    for (int i = 0; i < jarray.size(); i++) {
                        lstArticles.add(new Article(jarray.get(i).getAsJsonObject()));
                    }
                }
                adapter.notifyDataSetChanged();

                ((MainActivity2)getActivity()).setTitle("Articles");
                if (recherche.length() > 2)
                    ((MainActivity2)getActivity()).setTitle(lstArticles.size() + " Articles");
                break;
            case REQUEST_ADD_ARTICLE:
                ((MainActivity2)getActivity()).updatePanier();
                layoutDetails.setVisibility(View.GONE);
                ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                details = false;
                break;
        }

    }

    public void recherche(String _recherche) {
        if (_recherche.length() > 2) {
            recherche = _recherche;
            loadArticles();
        }
    }

    public void annuleRecherche() {
        recherche = "";
        loadArticles();
    }
}