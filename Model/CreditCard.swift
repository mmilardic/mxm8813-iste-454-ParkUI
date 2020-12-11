//
//  CreditCard.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 08/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase

class CreditCard: Codable {
    var name: String
    var expiration: String
    var cvv: String
    
    init(name: String, expiration: String, cvv: String)
    {
        self.name = name
        self.expiration = expiration
        self.cvv = cvv
    }
    
    func setValues(name: String, expiration: String, cvv: String){
        self.name = name
        self.expiration = expiration
        self.cvv = cvv
    }
}
