//
//  Zone.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase

struct Zone {
    var name: String
    var price: Float
    
    var dictionary: [String: Any] {
          return [
              "name": name,
              "price": price,
          ]
      }
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
    
    init?(dictionary: [String: Any]){
          guard
              let name = dictionary["name"] as? String,
              let price = dictionary["price"] as? Float
              else {
                  return nil
          }
          
          self.init(name: name,
                    price: price)
      }
    
}
