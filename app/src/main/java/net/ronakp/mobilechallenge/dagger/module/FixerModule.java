package net.ronakp.mobilechallenge.dagger.module;

import android.content.Context;

import net.ronakp.mobilechallenge.R;
import net.ronakp.mobilechallenge.service.FixerService;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by ronak on 2017-08-26.
 */

@Module
public class FixerModule {
    @Provides
    @Singleton
    FixerService fixerService(OkHttpClient okHttpClient, Context context) {
        return new Retrofit.Builder()
                .baseUrl(context.getString(R.string.url))
                .addConverterFactory(GsonConverterFactory.create())
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .client(okHttpClient)
                .build()
                .create(FixerService.class);
    }
}
