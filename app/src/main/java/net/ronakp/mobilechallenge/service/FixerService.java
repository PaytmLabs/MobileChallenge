package net.ronakp.mobilechallenge.service;

import net.ronakp.mobilechallenge.model.FixerResponse;

import io.reactivex.Observable;
import retrofit2.Call;
import retrofit2.http.GET;

/**
 * Created by ronak on 2017-08-26.
 */

public interface FixerService {
    @GET("latest")
    Call<FixerResponse> getLatestRates();
}
