//
//  MockNetworkStack.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-10.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation

class MockNetworkStack: NetworkStackProtocol {
    
    func downloadRates(completionHandler: @escaping (Data?) ->Void) {
        let response = "{'base':'EUR','date':'2017-02-10','rates':{'AUD':1.3905,'BGN':1.9558,'BRL':3.307,'CAD':1.3965,'CHF':1.0669,'CNY':7.312,'CZK':27.021,'DKK':7.4344,'GBP':0.8529,'HKD':8.2473,'HRK':7.4595,'HUF':308.45,'IDR':14134.0,'ILS':3.984,'INR':71.144,'JPY':120.65,'KRW':1222.6,'MXN':21.552,'MYR':4.7241,'NOK':8.9065,'NZD':1.4798,'PHP':53.096,'PLN':4.2953,'RON':4.5002,'RUB':62.276,'SEK':9.4873,'SGD':1.5112,'THB':37.302,'TRY':3.9173,'USD':1.0629,'ZAR':14.187}}".replacingOccurrences(of: "'", with: "\"")
        completionHandler(response.data(using:String.Encoding.utf8))
    }
}
