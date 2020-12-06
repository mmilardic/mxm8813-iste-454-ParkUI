//
//  Ticket.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase

struct Ticket {
    var zoneID: String
    var duration: Double
    
    var dictionary: [String: Any] {
          return [
              "zoneID": zoneID,
              "duration": duration,
          ]
      }
    
    init(zoneID: String, duration: Double) {
        self.zoneID = zoneID
        self.duration = duration
    }
    
    init?(dictionary: [String: Any]){
          guard
              let zoneID = dictionary["zoneID"] as? String,
            let duration = dictionary["duration"] as? Double
              else {
                  return nil
          }
          
          self.init(zoneID: zoneID,
                    duration: duration)
      }
}
