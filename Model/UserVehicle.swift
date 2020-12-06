//
//  UserVehicle.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase

struct UserVehicle {
    var name: String
    var plate: String
    var userID: String
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "plate": plate,
            "userID": userID
        ]
    }
    
    init(name: String,
         plate: String,
         userID: String)
    {
        self.name = name
        self.plate = plate
        self.userID = userID
    }
    
    init?(dictionary: [String: Any]){
        guard
            let name = dictionary["name"] as? String,
            let plate = dictionary["plate"] as? String,
            let userID = dictionary["userID"] as? String
            else {
                return nil
        }
        
        self.init(name: name,
                  plate: plate,
                  userID: userID)
        
    }
    
}
