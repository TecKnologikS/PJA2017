package fr.tecknologiks.myapplication.adaptateur;

import android.content.Context;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;

import fr.tecknologiks.myapplication.ObjectClass.Article;
import fr.tecknologiks.myapplication.R;

/**
 * Created by robinpauquet on 05/07/2017.
 */

public class PanierAdapter extends ArrayAdapter<Article> {

    public interface PanierListener {
        public abstract void onSuppr(int position);
        public abstract void onUpdate(int position, int qte);
    }

    private ArrayList<Article> dataSet;
    Context mContext;
    private PanierListener mPanierListener;


    // View lookup cache
    private static class ViewHolder {
        TextView tvNom;
        TextView tvPrix;
        Button btnSuppr;
        EditText edtCount;
    }

    public PanierAdapter(ArrayList<Article> data, Context context, PanierListener listener) {
        super(context, R.layout.adapter_panier, data);
        this.dataSet = data;
        this.mContext=context;
        this.mPanierListener = listener;

    }

    private int lastPosition = -1;

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        Article dataModel = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        final ViewHolder viewHolder; // view lookup cache stored in tag

        final View result;

        if (convertView == null) {

            viewHolder = new ViewHolder();
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.adapter_panier, parent, false);
            viewHolder.tvNom = (TextView) convertView.findViewById(R.id.tvNom);
            viewHolder.tvPrix = (TextView) convertView.findViewById(R.id.tvPrix);
            viewHolder.edtCount = (EditText) convertView.findViewById(R.id.edtCount);
            viewHolder.btnSuppr = (Button) convertView.findViewById(R.id.btnSuppr);

            result=convertView;

            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
            result=convertView;
        }

        Animation animation = AnimationUtils.loadAnimation(mContext, (position > lastPosition) ? R.anim.up_from_bottom : R.anim.down_from_top);
        result.startAnimation(animation);
        lastPosition = position;

        viewHolder.tvNom.setText(dataModel.getName());
        viewHolder.tvPrix.setText(String.valueOf(dataModel.getPrixFinal()) + " €");
        viewHolder.edtCount.setText(String.valueOf(dataModel.getQte()));
        viewHolder.edtCount.setTag(position);
        viewHolder.edtCount.setOnFocusChangeListener(new View.OnFocusChangeListener() {

            public void onFocusChange(View v, boolean hasFocus) {
                if(!hasFocus) {
                    int qte = Integer.parseInt(((EditText)v).getText().toString());
                    if (qte != dataSet.get((Integer)v.getTag()).getQte())
                        mPanierListener.onUpdate((Integer)v.getTag(), qte);
                }

            }
        });
        viewHolder.btnSuppr.setTag(position);
        viewHolder.btnSuppr.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mPanierListener.onSuppr((Integer)view.getTag());
            }
        });
        return convertView;
    }
}