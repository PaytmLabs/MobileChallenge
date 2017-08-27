package net.ronakp.mobilechallenge.dagger.module;

import android.app.Application;
import android.content.Context;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
    private Application application;

    public AppModule(Application application) {
        this.application = application;
    }

    @Provides
    @Singleton
    Context providesApplication() {
        return application;
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
