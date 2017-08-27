package net.ronakp.mobilechallenge.component;

import net.ronakp.mobilechallenge.activity.MainActivity;
import net.ronakp.mobilechallenge.module.FixerModule;

import javax.inject.Singleton;

import dagger.Component;

/**
 * Created by ronak on 2017-08-26.
 */

@Singleton
@Component(modules = {FixerModule.class})
public interface AppComponent {
    void inject(MainActivity mainActivity);
}
