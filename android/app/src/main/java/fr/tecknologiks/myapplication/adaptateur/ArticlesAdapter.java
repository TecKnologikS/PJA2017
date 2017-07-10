package fr.tecknologiks.myapplication.adaptateur;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import fr.tecknologiks.myapplication.ObjectClass.Article;
import fr.tecknologiks.myapplication.R;

import java.util.ArrayList;

/**
 * Created by robinpauquet on 04/07/2017.
 */


public class ArticlesAdapter extends ArrayAdapter<Article> {

    private ArrayList<Article> dataSet;
    Context mContext;

    // View lookup cache
    private static class ViewHolder {
        TextView tvNom;
        TextView tvPrix;
    }

    public ArticlesAdapter(ArrayList<Article> data, Context context) {
        super(context, R.layout.adapter_article, data);
        this.dataSet = data;
        this.mContext=context;

    }

    private int lastPosition = -1;

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        Article dataModel = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        ViewHolder viewHolder; // view lookup cache stored in tag

        final View result;

        if (convertView == null) {

            viewHolder = new ViewHolder();
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.adapter_article, parent, false);
            viewHolder.tvNom = (TextView) convertView.findViewById(R.id.tvNom);
            viewHolder.tvPrix = (TextView) convertView.findViewById(R.id.tvPrix);

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
        viewHolder.tvPrix.setText(String.valueOf(dataModel.getPrix()) + " €");
        return convertView;
    }
}