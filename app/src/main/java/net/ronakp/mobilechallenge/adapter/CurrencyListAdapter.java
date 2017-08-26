package net.ronakp.mobilechallenge.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;

/**
 * Created by ronak on 2017-08-26.
 */

public class CurrencyListAdapter extends RecyclerView.Adapter<CurrencyListAdapter.CurrencyDataViewHolder>{

    @Override
    public CurrencyListAdapter.CurrencyDataViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return null;
    }

    @Override
    public void onBindViewHolder(CurrencyListAdapter.CurrencyDataViewHolder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return 0;
    }

    public class CurrencyDataViewHolder extends RecyclerView.ViewHolder {

        public CurrencyDataViewHolder(View itemView) {
            super(itemView);
        }
    }
}
