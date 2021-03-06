package fr.tecknologiks.myapplication;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.AlertDialog;
import android.util.Patterns;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
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


public class PanierFragment extends Fragment implements PanierAdapter.PanierListener, AsyncResponse, SubActivity {
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
    final int REQUEST_VALIDATE = 4;
    boolean block = false;
    EditText edtCode;
    ImageButton btnAdd;
    TextView tvTotal;
    TextView tvReduct;
    TextView tvFinal;

    final int MENU_PANIER = R.menu.menu_panier;
    final int MENU_ADDITION_ = R.menu.menu_addition;
    final int MENU_VALIDATE = R.menu.menu_validate;
    ProgressDialog dialog;
    LinearLayout layoutAddition;
    LinearLayout layoutValidate;

    EditText edtSociete;
    EditText edtSiret;
    EditText edtNom;
    EditText edtPrenom;
    EditText edtAdresse;
    EditText edtCP;
    EditText edtVille;
    EditText edtTel;
    EditText edtEmail;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_panier, container, false);
        lvPanier = (ListView)rootView.findViewById(R.id.lvPanier);
        layoutAddition = (LinearLayout)rootView.findViewById(R.id.layoutAddition);
        layoutValidate = (LinearLayout)rootView.findViewById(R.id.layoutValidate);
        edtCode = (EditText) rootView.findViewById(R.id.edtCode);


        edtSociete = (EditText) rootView.findViewById(R.id.edtSociete);
        edtSiret = (EditText) rootView.findViewById(R.id.edtSiret);
        edtNom = (EditText) rootView.findViewById(R.id.edtNom);
        edtPrenom = (EditText) rootView.findViewById(R.id.edtPrenom);
        edtAdresse = (EditText) rootView.findViewById(R.id.edtAdresse);
        edtCP = (EditText) rootView.findViewById(R.id.edtCP);
        edtVille = (EditText) rootView.findViewById(R.id.edtVille);
        edtTel = (EditText) rootView.findViewById(R.id.edtTel);
        edtEmail = (EditText) rootView.findViewById(R.id.edtEmail);

        tvTotal = (TextView) rootView.findViewById(R.id.tvTotal);
        tvReduct = (TextView) rootView.findViewById(R.id.tvReduct);
        tvFinal = (TextView) rootView.findViewById(R.id.tvFinal);
        btnAdd = (ImageButton) rootView.findViewById(R.id.btnAdd);
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (edtCode.getText().toString().trim().length() > 3){
                    HashMap<String, String> dict = new HashMap<String, String>();
                    dict.put("code", edtCode.getText().toString().trim());
                    APIRequest api = new APIRequest(Request.POST, API.AddPromo(), new Gson().toJson(dict), REQUEST_PROMO);
                    api.delegate = PanierFragment.this;
                    api.execute();

                }
            }
        });
        adapter = new PanierAdapter(Panier.getInstance().getArticles(), getContext(), this);
        lvPanier.setAdapter(adapter);
        setHasOptionsMenu(true);
        ((MainActivity2)getActivity()).setMenu(MENU_PANIER);
        ((MainActivity2)getActivity()).setTitle("Panier (" + Panier.getInstance().getPrix_final() + " €)");
        if(Panier.getInstance().getPromos().size() > 0)
            edtCode.setText(Panier.getInstance().getPromos().get(0).getCode());
        tvTotal.setText(String.valueOf(Panier.getInstance().getPrix_total()) + " €");
        tvReduct.setText(String.valueOf(Panier.getInstance().getRedution_total()) + " €");
        tvFinal.setText(String.valueOf(Panier.getInstance().getPrix_final()) + " €");
        if(((MainActivity2)getActivity()) != null)
            ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);

        return rootView;
    }

    public void unshow() {
        switch(etat) {
            case ETAT_VALIDATE:
                layoutValidate.setVisibility(View.GONE);
                showAddition();
                break;
            case ETAT_ADDITION:
                layoutAddition.setVisibility(View.GONE);
                ((MainActivity2)getActivity()).setMenu(MENU_PANIER);
                etat = ETAT_PANIER;
                ((MainActivity2) getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                ((MainActivity2)getActivity()).setTitle("Panier (" + Panier.getInstance().getPrix_final() + " €)");
                break;
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                unshow();
                return true;
            case R.id.addition:
                showAddition();
                break;
            case R.id.createdevis:

                if (!android.util.Patterns.EMAIL_ADDRESS.matcher(edtEmail.getText().toString()).matches())  {
                    edtEmail.setError("Email invalide");
                    return false;
                }

                if (!edtTel.getText().toString().isEmpty()) {
                    if (!Patterns.PHONE.matcher(edtTel.getText().toString()).matches())  {
                        edtTel.setError("Numéro de téléphone invalide");
                        return false;
                    }
                }

                if (edtNom.getText().toString().trim().length() > 1 && edtPrenom.getText().toString().trim().length() > 1
                        && edtSociete.getText().toString().trim().length() > 1 && edtEmail.getText().toString().trim().length() > 1 && block == false) {
                    block = true;
                    dialog = ProgressDialog.show(getContext(), "",
                            "Création en cours...", true);
                    HashMap<String, String> dict = new HashMap<String, String>();
                    dict.put("societe", edtSociete.getText().toString());
                    dict.put("siret",   edtSiret.getText().toString());
                    dict.put("tel",     edtTel.getText().toString());
                    dict.put("fax",     "");
                    dict.put("email",   edtEmail.getText().toString());
                    dict.put("adresse", edtAdresse.getText().toString());
                    dict.put("cp",      edtCP.getText().toString());
                    dict.put("ville",   edtVille.getText().toString());
                    dict.put("nom",     edtNom.getText().toString());
                    dict.put("prenom",  edtPrenom.getText().toString());

                    String test = new Gson().toJson(dict);
                    APIRequest api = new APIRequest(Request.POST, API.Validate(), test, REQUEST_VALIDATE);
                    api.delegate = PanierFragment.this;
                    api.execute();
                } else {
                    edtNom.setError("Champs Requis");
                    edtPrenom.setError("Champs Requis");
                    edtSociete.setError("Champs Requis");
                }

                break;
            case R.id.validate:
                showValidate();
                break;
        }
        return false;
    }

    public void showAddition() {
        etat = ETAT_ADDITION;
        ((MainActivity2)getActivity()).setTitle("Addition");
        layoutAddition.setVisibility(View.VISIBLE);
        ((MainActivity2) getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        ((MainActivity2)getActivity()).setMenu(MENU_ADDITION_);

    }

    public void showValidate() {
        etat = ETAT_VALIDATE;
        ((MainActivity2)getActivity()).setTitle("Informations");
        layoutValidate.setVisibility(View.VISIBLE);
        ((MainActivity2) getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        ((MainActivity2)getActivity()).setMenu(MENU_VALIDATE);

    }

    @Override
    public void onSuppr(final int position) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setMessage("Supprimer cet article ?")
                .setPositiveButton("Je confirme", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog2, int id) {

                        if (dialog == null || !dialog.isShowing()) {
                            dialog = ProgressDialog.show(getContext(), "",
                                    "Suppression en cours...", true);
                            HashMap<String, String> dict = new HashMap<String, String>();
                            dict.put("id", String.valueOf(Panier.getInstance().getArticles().get(position).getId()));
                            String test = new Gson().toJson(dict);
                            APIRequest api = new APIRequest(Request.POST, API.RemoveToBasket(), test, REQUEST_UPDATE);
                            api.delegate = PanierFragment.this;
                            api.execute();
                        }
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
        if (dialog == null || !dialog.isShowing()) {
            dialog = ProgressDialog.show(getContext(), "",
                    "Mise à jours en cours...", true);
            APIRequest api = new APIRequest(Request.POST, API.UpdateToBasket(), test, REQUEST_UPDATE);
            api.delegate = PanierFragment.this;
            api.execute();
        }
    }

    @Override
    public void processFinish(ResponseAPI response) {
        if (dialog != null)
            dialog.cancel();
        switch (response.getInfo_sup()) {
            case REQUEST_VALIDATE:
                block = false;
                layoutAddition.setVisibility(View.GONE);
                layoutValidate.setVisibility(View.GONE);
                ((MainActivity2)getActivity()).setMenu(MENU_PANIER);
                etat = ETAT_PANIER;
                ((MainActivity2) getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                updatePanier();
                break;
            case REQUEST_UPDATE:
            case REQUEST_SUPPR:
            case REQUEST_PROMO:
                updatePanier();
                break;
            case REQUEST_LOAD:
                if (response.getCode() == HttpURLConnection.HTTP_OK) {
                    Panier.getInstance().fromJSON(response.getBody());
                    adapter.notifyDataSetChanged();
                    ((MainActivity2)getActivity()).setTitle("Panier (" + Panier.getInstance().getPrix_final() + " €)");
                    if(Panier.getInstance().getPromos().size() > 0)
                        edtCode.setText(Panier.getInstance().getPromos().get(0).getCode());
                    tvTotal.setText(String.valueOf(Panier.getInstance().getPrix_total()) + " €");
                    tvReduct.setText(String.valueOf(Panier.getInstance().getRedution_total()) + " €");
                    tvFinal.setText(String.valueOf(Panier.getInstance().getPrix_final()) + " €");
                }
                break;
        }
    }

    public void updatePanier() {
        dialog = ProgressDialog.show(getContext(), "",
                "Mise à jours en cours...", true);
        APIRequest api = new APIRequest(Request.GET, API.Panier(), "", 0);
        api.delegate = PanierFragment.this;
        api.execute();
    }

    @Override
    public void onBackPressed() {
        if (etat == ETAT_PANIER) {
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
            unshow();
        }
    }
}