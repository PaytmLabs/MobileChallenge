package net.ronakp.mobilechallenge.dagger.component;

import net.ronakp.mobilechallenge.activity.MainActivity;
import net.ronakp.mobilechallenge.dagger.module.AppModule;
import net.ronakp.mobilechallenge.dagger.module.FixerModule;

import javax.inject.Singleton;

import dagger.Component;

/**
 * Created by ronak on 2017-08-26.
 */

@Singleton
@Component(modules = {AppModule.class, FixerModule.class})
public interface AppComponent {
    void inject(MainActivity mainActivity);
}
