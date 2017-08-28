package net.ronakp.mobilechallenge.module;

import android.content.Context;

import net.ronakp.mobilechallenge.R;
import net.ronakp.mobilechallenge.service.FixerService;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by ronak on 2017-08-26.
 */

public class FixerModule {

    private static Retrofit retrofit = null;

    public static Retrofit getClient(String url) {
        if (retrofit == null) {
            retrofit = new Retrofit.Builder()
                    .baseUrl(url)
                    .addConverterFactory(GsonConverterFactory.create())
                    .build();
        }
        return retrofit;
    }
    /*FixerService fixerService(Context context) {
        return new Retrofit.Builder()
                .baseUrl(context.getString(R.string.url))
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }*/
}
