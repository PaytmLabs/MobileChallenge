package net.ronakp.mobilechallenge.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.util.Log;

import net.ronakp.mobilechallenge.R;
import net.ronakp.mobilechallenge.model.FixerResponse;
import net.ronakp.mobilechallenge.module.FixerHelperModule;
import net.ronakp.mobilechallenge.service.FixerService;

import butterknife.BindView;
import butterknife.ButterKnife;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    private FixerService fixerService;

    @BindView(R.id.currencylist)
    RecyclerView currencyListView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.bind(this);

        fixerService = FixerHelperModule.getFixerService();

        fixerService.getLatestRates().enqueue(new Callback<FixerResponse>() {
            @Override
            public void onResponse(Call<FixerResponse> call, Response<FixerResponse> response) {
                Log.d("hello", "post submitted to API." + response.body().getRates().getAUD());
            }

            @Override
            public void onFailure(Call<FixerResponse> call, Throwable t) {

            }
        });
    }
}
