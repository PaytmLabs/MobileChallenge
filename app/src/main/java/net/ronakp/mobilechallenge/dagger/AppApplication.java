package net.ronakp.mobilechallenge.dagger;

import android.app.Application;

import net.ronakp.mobilechallenge.dagger.component.AppComponent;
import net.ronakp.mobilechallenge.dagger.component.DaggerAppComponent;
import net.ronakp.mobilechallenge.dagger.module.AppModule;
import net.ronakp.mobilechallenge.dagger.module.FixerModule;

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
                .appModule(new AppModule(this))
                .build();
    }
}
