//
//  Notifications.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-10.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation


class Notifications {

    class func notificationDataUpdated()->NSNotification.Name {
        return Notification.Name("DataHasBeenUpdated")
    }
    
    class func notificationInputUpdated()->NSNotification.Name {
        return Notification.Name("InputHasBeenUpdated")
    }
}
