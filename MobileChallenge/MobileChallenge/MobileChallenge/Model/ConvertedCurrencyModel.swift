//
//  ConvertedCurrencyModel.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-28.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation

class ConvertedCurrencyModel: NSObject {
    
    //
    // MARK:- properties
    //
    
    @objc var fromCurrency: String?
    @objc var toCurrency: String?
    @objc var rate: AnyObject?
}
