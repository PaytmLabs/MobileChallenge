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
    private let kMaxOfflineTime:TimeInterval = 60 * 30 // half an hour
    
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
        
        self.lastServerResponse = self.getLastServerResponse()
        if (self.lastServerResponse != nil) {
            self.dataModel.update(data: self.lastServerResponse?.data as! Data)
            NotificationCenter.default.post(name: self.notificationName, object: nil)
        }
        
        let completion: (Data?) -> Void = { data in

            CoreDataStack.shared.performForegroundTask({ context in

                self.dataModel.update(data: data!)

                var response = self.getLastServerResponse()
                if (response == nil) {
                    response = NSEntityDescription.insertNewObject(forEntityName: self.entityName, into:context) as? ServerResponse
                }
                response?.timestamp = Date().description
                response?.data = data as NSData?
                CoreDataStack.shared.saveContext()

                NotificationCenter.default.post(name: self.notificationName, object: nil)
            })
        }
        
        var timeDiff = kMaxOfflineTime
        if (self.lastServerResponse != nil) {
            timeDiff = Date().timeIntervalSince(Date.from(description: (self.lastServerResponse?.timestamp)!))
        }
            if (timeDiff >= kMaxOfflineTime) {
            NetworkStack.downloadRates(completionHandler: completion)
        }
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
        return  String(self.dataModel.conversionValue(forRow:forRow)).asCurrency()
    }
    
    func baseCurrencyIndex() ->Int {
        return dataModel.baseCurrencyIndex
    }
    
    func setBaseCurrency(atIndex: Int) {
        self.dataModel.baseCurrencyIndex = atIndex
    }

    func setBaseCurencyInputValue(atValue: Double?) {
        guard let atValue = atValue else {
            return
        }
        self.dataModel.baseCurencyInputValue = atValue
    }
    
}



