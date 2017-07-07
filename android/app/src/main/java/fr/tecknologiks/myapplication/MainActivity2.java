package fr.tecknologiks.myapplication;

import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.SearchView;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;

import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;

import fr.tecknologiks.myapplication.ObjectClass.Panier;
import fr.tecknologiks.myapplication.ObjectClass.Request;
import fr.tecknologiks.myapplication.ObjectClass.ResponseAPI;
import fr.tecknologiks.myapplication.ObjectClass.User;
import fr.tecknologiks.myapplication.Param.API;
import fr.tecknologiks.myapplication.function.APIRequest;
import fr.tecknologiks.myapplication.interfaceClass.AsyncResponse;

public class MainActivity2 extends AppCompatActivity implements AsyncResponse {

    private TextView mTextMessage;
    private static final String TAG_FRAGMENT_CALLS = "tag_frag_calls";
    private static final String TAG_FRAGMENT_RECENTS = "tag_frag_recents";
    private static final String TAG_FRAGMENT_TRIPS = "tag_frag_trips";
    private List<Fragment> fragments = new ArrayList<>(3);
    SearchView searchView;
    int menu = R.menu.menu_top;

    private BottomNavigationView bottomNavigationView;

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    switchFragment(0, TAG_FRAGMENT_CALLS);
                    return true;
                case R.id.navigation_dashboard:
                    switchFragment(1, TAG_FRAGMENT_RECENTS);
                    return true;
                case R.id.navigation_notifications:
                    switchFragment(2, TAG_FRAGMENT_TRIPS);
                    return true;
            }
            return false;
        }

    };

    @Override
    protected void onResume() {
        super.onResume();
        if (User.getInstance().isCorrect()) {
            updatePanier();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
         buildFragmentsList();

        // Set the 0th Fragment to be displayed by default.
        switchFragment(0, TAG_FRAGMENT_CALLS);
        if (!User.getInstance().isCorrect()) {
            startActivity(new Intent(this, LoginActivity.class));
        }
    }

    private void switchFragment(int pos, String tag) {
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.frame_fragmentholder, fragments.get(pos), tag)
                .commit();
    }


    private void buildFragmentsList() {
        BottomBarFragment tripsFragment = buildFragment("Trips");
        ArticleFragment articles = new ArticleFragment();
        Bundle bundle = new Bundle();
        bundle.putString(ArticleFragment.ARG_TITLE, "");
        articles.setArguments(bundle);

        PanierFragment panier = new PanierFragment();
        Bundle bundle2 = new Bundle();
        bundle2.putString(ArticleFragment.ARG_TITLE, "");
        panier.setArguments(bundle2);


        DevisFragment devis = new DevisFragment();
        Bundle bundle3 = new Bundle();
        bundle3.putString(DevisFragment.ARG_TITLE, "");
        panier.setArguments(bundle3);


        fragments.add(articles);
        fragments.add(panier);
        fragments.add(devis);
    }

    /**
     * Creates a {@link BottomBarFragment} with corresponding Item title.
     *
     * @param title
     * @return
     */
    private BottomBarFragment buildFragment(String title) {
        BottomBarFragment fragment = new BottomBarFragment();
        Bundle bundle = new Bundle();
        bundle.putString(BottomBarFragment.ARG_TITLE, title);
        fragment.setArguments(bundle);
        return fragment;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (this.menu == R.menu.menu_top) {
            MenuInflater inflater = getMenuInflater();
            inflater.inflate(this.menu, menu);
            SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
            searchView = (SearchView) menu.findItem(R.id.search).getActionView();
            searchView.setSearchableInfo(searchManager.getSearchableInfo(getComponentName()));
            searchView.setOnCloseListener(new SearchView.OnCloseListener() {
                @Override
                public boolean onClose() {
                    final Fragment currentFragment = getSupportFragmentManager().findFragmentById(R.id.frame_fragmentholder);
                    if (currentFragment != null && currentFragment.getClass() == ArticleFragment.class) {
                        ((ArticleFragment)currentFragment).annuleRecherche();
                        searchView.onActionViewCollapsed();
                    }
                    return true;
                }
            });
        } else {
            MenuInflater inflater = getMenuInflater();
            inflater.inflate(this.menu, menu);
        }


        return true;
    }


    public void setMenu(int menu) {
        this.menu = menu;
        invalidateOptionsMenu();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Due to a problem of not being able to intercept android.R.id.home in fragments,
        // we start passing the event to the currently displayed fragment.
        // REF: http://stackoverflow.com/questions/21938419/intercepting-actionbar-home-button-in-fragment
        final Fragment currentFragment = getSupportFragmentManager().findFragmentById(R.id.frame_fragmentholder);
        if (currentFragment != null && currentFragment.onOptionsItemSelected(item)) {
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
            final Fragment currentFragment = getSupportFragmentManager().findFragmentById(R.id.frame_fragmentholder);
            if (currentFragment != null && currentFragment.getClass() == ArticleFragment.class) {
                ((ArticleFragment)currentFragment).recherche(intent.getStringExtra(SearchManager.QUERY));
            }
        }
    }

    public void updatePanier() {
        APIRequest api = new APIRequest(Request.GET, API.Panier(), "", 0);
        api.delegate = MainActivity2.this;
        api.execute();
    }

    @Override
    public void processFinish(ResponseAPI response) {
        if (response.getCode() == HttpURLConnection.HTTP_OK) {
            Panier.getInstance().fromJSON(response.getBody());
        }
    }
}
