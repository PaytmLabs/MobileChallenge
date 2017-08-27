package net.ronakp.mobilechallenge.model;

import java.util.Date;
import java.util.Map;

/**
 * Created by ronak on 2017-08-26.
 */

public class FixerResponse {
    String base;
    Date date;
    Map<String, String> rates;

    public String getBase() {
        return base;
    }

    public void setBase(String base) {
        this.base = base;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Map<String, String> getRates() {
        return rates;
    }

    public void setRates(Map<String, String> rates) {
        this.rates = rates;
    }
}
