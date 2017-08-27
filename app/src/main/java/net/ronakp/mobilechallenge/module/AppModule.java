package net.ronakp.mobilechallenge.module;

import android.app.Application;
import android.content.Context;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.Cache;
import okhttp3.OkHttpClient;

/**
 * Created by ronak on 2017-08-27.
 */

@Module
public class AppModule {
    private Context context;

    public AppModule(Context context) {
        this.context = context;
    }

    @Provides
    @Singleton
    Context providesAppContext() {
        return context;
    }

    @Provides
    @Singleton
    Cache provideOkhttpCache(Context context) {
        int size = 10 * 1024 * 1024;
        return new Cache(context.getCacheDir(), size);
    }

    @Provides
    @Singleton
    OkHttpClient provideOkhttpClient(Cache cache) {
        return new OkHttpClient.Builder()
                .cache(cache)
                .build();
    }
}
