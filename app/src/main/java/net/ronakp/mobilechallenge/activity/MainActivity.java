package net.ronakp.mobilechallenge.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.util.Log;

import net.ronakp.mobilechallenge.AppApplication;
import net.ronakp.mobilechallenge.R;
import net.ronakp.mobilechallenge.model.FixerResponse;
import net.ronakp.mobilechallenge.service.FixerService;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import io.reactivex.Single;
import retrofit2.Retrofit;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;

public class MainActivity extends AppCompatActivity {

    @BindView(R.id.currencylist)
    RecyclerView currencyListView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.bind(this);

        ((AppApplication)getApplication()).getAppComponent().inject(this);
    }
}
