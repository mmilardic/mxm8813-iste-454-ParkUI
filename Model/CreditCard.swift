//
//  CreditCard.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 08/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase

struct CreditCard {
    var name: String
    var expiration: String
    var cvv: String
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "expiration": expiration,
            "cvv": cvv
        ]
    }
    
    init(name: String,
         expiration: String,
         cvv: String
         )
    {
        self.name = name
        self.expiration = expiration
        self.cvv = cvv
    }
    
    init?(dictionary: [String: Any]){
        guard
            let name = dictionary["name"] as? String,
            let expiration = dictionary["expiration"] as? String,
            let cvv = dictionary["cvv"] as? String
            else {
                return nil
        }
        
        self.init(name: name,
                  expiration: expiration,
                  cvv: cvv
        )
    }
    
}
