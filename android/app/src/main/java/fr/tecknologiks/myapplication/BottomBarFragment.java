package fr.tecknologiks.myapplication;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Created by robinpauquet on 05/07/2017.
 */

public class BottomBarFragment extends Fragment {
    public static final String ARG_TITLE = "arg_title";
    private TextView textView;
    private int test = 0;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_bottom_bar, container, false);
        textView = (TextView) rootView.findViewById(R.id.fragment_bottom_bar_text_activetab);
        setHasOptionsMenu(true);
        String title = getArguments().getString(ARG_TITLE, "");
        textView.setText(title + test);
        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                test++;
                BottomBarFragment fragment = new BottomBarFragment();
                Bundle bundle = new Bundle();
                bundle.putString(BottomBarFragment.ARG_TITLE, "");
                fragment.setArguments(bundle);
                textView.setText(getArguments().getString(ARG_TITLE, "") + test);
            }
        });


        ((MainActivity2)getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        return rootView;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                Toast.makeText(getContext(), "COUCOU CA MARCHE", Toast.LENGTH_SHORT).show();
                return true;
        }
        return false;
    }
}