package net.ronakp.mobilechallenge.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;

import net.ronakp.mobilechallenge.R;
import net.ronakp.mobilechallenge.service.FixerService;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;

public class MainActivity extends AppCompatActivity {

    /*@Inject
    FixerService fixerService;*/

    @BindView(R.id.currencylist)
    RecyclerView currencyListView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.bind(this);
    }
}
