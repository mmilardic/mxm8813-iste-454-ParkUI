//
//  UserTicket.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 25/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//


import Foundation
import Firebase

struct UserTicket {
    var userID: String
    var ticketID: String
    var userVehicleID: String
    var expiryDate: Date
    var boughtDate: Date
    
    var dictionary: [String: Any] {
        return [
            "userID": userID,
            "ticketID": ticketID,
            "userVehicleID": userVehicleID,
            "expiryDate": expiryDate,
            "boughtDate": boughtDate,
            
        ]
    }
    
    init(userID: String,
         ticketID: String,
         userVehicleID: String,
         expiryDate: Date,
         boughtDate: Date
         )
    {
        self.userID = userID
        self.ticketID = ticketID
        self.userVehicleID = userVehicleID
        self.expiryDate = expiryDate
        self.boughtDate = boughtDate
    }
    
    init?(dictionary: [String: Any]){
        guard
            let userID = dictionary["userID"] as? String,
            let ticketID = dictionary["ticketID"] as? String,
            let userVehicleID = dictionary["userVehicleID"] as? String,
            let expiryDate = dictionary["expiryDate"] as? Date,
            let boughtDate = dictionary["boughtDate"] as? Date
            else {
                return nil
        }
        
        self.init(userID: userID,
                  ticketID: ticketID,
                  userVehicleID: userVehicleID,
                  expiryDate: expiryDate,
                  boughtDate: boughtDate)
    }
    
}
