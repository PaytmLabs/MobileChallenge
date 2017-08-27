package net.ronakp.mobilechallenge;

import android.app.Application;
import android.content.Context;
import android.support.multidex.MultiDex;

import net.ronakp.mobilechallenge.component.AppComponent;
import net.ronakp.mobilechallenge.component.DaggerAppComponent;
import net.ronakp.mobilechallenge.module.FixerModule;

/**
 * Created by ronak on 2017-08-26.
 */

public class AppApplication extends Application {
    private AppComponent appComponent;

    public AppComponent getAppComponent() {
        return appComponent;
    }

    @Override
    public void onCreate() {
        super.onCreate();

        appComponent = DaggerAppComponent.builder()
                .fixerModule(new FixerModule())
                .build();
    }

    @Override
    public void attachBaseContext(Context context) {
        MultiDex.install(context);
        super.attachBaseContext(context);
    }
}
