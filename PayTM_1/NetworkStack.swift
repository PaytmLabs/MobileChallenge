//
//  NetworkStack.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-10.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation

class NetworkStack {

    class func downloadRates(completionHandler: @escaping (Data?) ->Void) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let apiUrlString = "https://api.fixer.io/latest"
        let url = URL(string: apiUrlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                completionHandler(data)
            }
        })
        task.resume()
    }




}
