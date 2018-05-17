package net.ronakp.mobilechallenge.module;

import net.ronakp.mobilechallenge.service.FixerService;

/**
 * Created by ronak on 2017-08-27.
 */

public class FixerHelperModule {

    private FixerHelperModule() {}

    public static final String URL = "http://api.fixer.io/";

    public static FixerService getFixerService() {
        return FixerModule.getClient(URL).create(FixerService.class);
    }
}
