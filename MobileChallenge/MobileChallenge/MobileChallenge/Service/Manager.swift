//
//  Manager.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-27.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class currencyConverter {
    static var sharedInstance = currencyConverter()
    
    //
    // MARK:- implementations
    //
    
    func getRequestValues(completion: @escaping (String, String, NSDictionary) -> ()) {
        let todoEndpoint: String = "https://api.fixer.io/latest"
        Alamofire.request(todoEndpoint, method: .get).responseJSON { response in
            let result = JSON(response.result.value ?? "")
            let base = result["base"].stringValue
            let date = result["date"].stringValue
            let rates = result["rates"].dictionaryObject
            completion(base, date, rates! as NSDictionary)
        }
    }
}
