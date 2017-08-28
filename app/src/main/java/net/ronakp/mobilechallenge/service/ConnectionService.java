package net.ronakp.mobilechallenge.service;

import android.os.Handler;

import net.ronakp.mobilechallenge.model.FixerResponse;

import javax.inject.Singleton;

import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;
import io.reactivex.observers.ResourceSingleObserver;

/**
 * Created by ronak on 2017-08-27.
 */

@Singleton
public class ConnectionService {

    private FixerService fixerService;

    public void sendRequest(final Handler hanlder) {

        fixerService.getLatestRates()
                .subscribe(new ResourceSingleObserver<FixerResponse>() {
                    @Override
                    public void onSuccess(@NonNull FixerResponse fixerResponse) {

                    }

                    @Override
                    public void onError(@NonNull Throwable e) {

                    }
                });
    }
}
