//
//  DataProvider.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-09.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation
import CoreData

class DataProvider {
    
    static let shared = DataProvider()
    
    lazy var entityName = String(describing: ServerResponse.self)
    lazy var dataModel = DataModel()
    let notificationName = Notifications.notificationDataUpdated()

    private var lastServerResponse: ServerResponse?
    func getLastServerResponse ()-> ServerResponse? {
    
        if (self.lastServerResponse != nil) {
            return self.lastServerResponse
        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        do {
            let records = try CoreDataStack.shared.viewContext.fetch(fetchRequest)
            if let records = records as? [NSManagedObject] {
                if (records.count > 0) {
                    self.lastServerResponse = records[0] as? ServerResponse
                } else {
                    return nil
                }
            }
        } catch {
            print("Unable to fetch managed objects for entity: \(self.entityName)")
        }
        return self.lastServerResponse
    }


    
    func updateData() {
        
        //TPDO  update also 1-stamp label, 2-button,  3-cells.
        
        
        self.lastServerResponse = self.getLastServerResponse()
        if (self.lastServerResponse != nil) {
            self.dataModel.update(data: self.lastServerResponse?.data as! Data)
            NotificationCenter.default.post(name: self.notificationName, object: nil)
        }
        
        
        let completion: (Data?) -> Void = { data in

            CoreDataStack.shared.performForegroundTask({ context in

                self.dataModel.update(data: data!)
                NotificationCenter.default.post(name: self.notificationName, object: nil)
                NotificationCenter.default.post(name: Notifications.notificationInputUpdated(), object: nil)

                guard let response = self.getLastServerResponse()
                    else {
                        let serverResponse: ServerResponse = NSEntityDescription.insertNewObject(forEntityName: self.entityName, into:context) as! ServerResponse
                        serverResponse.timestamp = Date().description
                        serverResponse.data = data as NSData?
                        return
                }
                response.timestamp = Date().description
                response.data = data as NSData?
            })
        }
        
        NetworkStack.downloadRates(completionHandler: completion)
    }
    
}


extension DataProvider { // collection view + conversion value calc
    
    
    func numberOfCurrencies () -> Int {
        return self.dataModel.rates.count
    }

    func currency(forRow row: Int)-> String {
        return self.dataModel.currencies[row]
    }
    
    func conversionValue(forRow:Int)->String {
        return "I am converted Value"
    }
    
    // set current input value and currence + pass it to the model
    
}



