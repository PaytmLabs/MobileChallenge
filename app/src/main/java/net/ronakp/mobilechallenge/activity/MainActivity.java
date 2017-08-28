package net.ronakp.mobilechallenge.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

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

    @BindView(R.id.base)
    TextView base;

    @BindView(R.id.textView)
    TextView aud;

    @BindView(R.id.textView1)
    TextView bgn;

    @BindView(R.id.textView2)
    TextView brl;

    @BindView(R.id.textView3)
    TextView cad;

    @BindView(R.id.textView4)
    TextView chf;

    @BindView(R.id.textView5)
    TextView cny;

    @BindView(R.id.textView6)
    TextView czk;

    @BindView(R.id.textView7)
    TextView dkk;

    @BindView(R.id.textView8)
    TextView gbp;

    @BindView(R.id.textView9)
    TextView hkd;

    @BindView(R.id.textView10)
    TextView hrk;

    @BindView(R.id.textView11)
    TextView huf;

    @BindView(R.id.textView12)
    TextView idr;

    @BindView(R.id.textView13)
    TextView ils;

    @BindView(R.id.textView14)
    TextView inr;

    @BindView(R.id.textView15)
    TextView jpy;

    @BindView(R.id.textView16)
    TextView krw;

    @BindView(R.id.textView17)
    TextView mxn;

    @BindView(R.id.textView18)
    TextView myr;

    @BindView(R.id.textView19)
    TextView nok;

    @BindView(R.id.textView20)
    TextView nzd;

    @BindView(R.id.textView21)
    TextView php;

    @BindView(R.id.textView22)
    TextView pln;

    @BindView(R.id.textView23)
    TextView ron;

    @BindView(R.id.textView24)
    TextView rub;

    @BindView(R.id.textView25)
    TextView sek;

    @BindView(R.id.textView26)
    TextView sjd;

    @BindView(R.id.textView27)
    TextView thb;

    @BindView(R.id.textView28)
    TextView tru;

    @BindView(R.id.textView29)
    TextView usd;

    @BindView(R.id.textView30)
    TextView zar;

    @BindView(R.id.imageButton)
    ImageButton refresh;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ButterKnife.bind(this);

        fixerService = FixerHelperModule.getFixerService();

        callRates();

        refresh.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                callRates();
                Toast.makeText(getApplicationContext(), "Rate Refreshed", Toast.LENGTH_SHORT).show();
            }
        });
    }

    public void callRates() {
        fixerService.getLatestRates().enqueue(new Callback<FixerResponse>() {
            @Override
            public void onResponse(Call<FixerResponse> call, Response<FixerResponse> response) {
                Log.d("Fixer Success : ", response.body().toString());
                base.setText("Base  : " + response.body().getBase().toString());
                aud.setText("aud : " + response.body().getRates().getAUD().toString());
                bgn.setText("bgn : " + response.body().getRates().getBGN().toString());
                brl.setText("brl : " + response.body().getRates().getBRL().toString());
                cad.setText("cad : " + response.body().getRates().getCAD().toString());
                chf.setText("chf : " + response.body().getRates().getCHF().toString());
                cny.setText("cny : " + response.body().getRates().getCNY().toString());
                czk.setText("czk : " + response.body().getRates().getCZK().toString());
                dkk.setText("dkk : " + response.body().getRates().getDKK().toString());
                gbp.setText("gbp : " + response.body().getRates().getGBP().toString());
                hkd.setText("hkd : " + response.body().getRates().getHKD().toString());
                hrk.setText("hrk : " + response.body().getRates().getHRK().toString());
                huf.setText("huf : " + response.body().getRates().getHUF().toString());
                idr.setText("idr : " + response.body().getRates().getIDR().toString());
                ils.setText("ils : " + response.body().getRates().getILS().toString());
                inr.setText("inr : " + response.body().getRates().getINR().toString());
                jpy.setText("jpy : " + response.body().getRates().getJPY().toString());
                krw.setText("krw : " + response.body().getRates().getKRW().toString());
                mxn.setText("mxn : " + response.body().getRates().getMXN().toString());
                myr.setText("myr : " + response.body().getRates().getMYR().toString());
                nok.setText("nok : " + response.body().getRates().getNOK().toString());
                nzd.setText("nzd : " + response.body().getRates().getNZD().toString());
                php.setText("php : " + response.body().getRates().getPHP().toString());
                pln.setText("pln : " + response.body().getRates().getPLN().toString());
                ron.setText("ron : " + response.body().getRates().getRON().toString());
                rub.setText("rub : " + response.body().getRates().getRUB().toString());
                sek.setText("sek : " + response.body().getRates().getSEK().toString());
                sjd.setText("sjd : " + response.body().getRates().getSGD().toString());
                thb.setText("thb : " + response.body().getRates().getTHB().toString());
                tru.setText("tru : " + response.body().getRates().getTRY().toString());
                usd.setText("usd : " + response.body().getRates().getUSD().toString());
                zar.setText("zar : " + response.body().getRates().getZAR().toString());
            }

            @Override
            public void onFailure(Call<FixerResponse> call, Throwable t) {
                Log.e("Fixer Error : ", t.toString());

            }
        });
    }
}
