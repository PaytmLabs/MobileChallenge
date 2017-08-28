package net.ronakp.mobilechallenge.activity;

import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;

import net.ronakp.mobilechallenge.dagger.AppApplication;
import net.ronakp.mobilechallenge.R;
import net.ronakp.mobilechallenge.service.ConnectionService;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import retrofit2.Retrofit;

public class MainActivity extends AppCompatActivity implements Handler.Callback{

    @Inject
    ConnectionService connectionService;

    @BindView(R.id.currencylist)
    RecyclerView currencyListView;

    private Handler handler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.bind(this);

        ((AppApplication)getApplication()).getAppComponent().inject(this);

        handler = new Handler(this);
        connectionService.sendRequest(handler);
    }

    @Override
    public boolean handleMessage(Message message) {
        return false;
    }
}
