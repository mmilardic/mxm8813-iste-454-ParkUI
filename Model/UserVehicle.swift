//
//  UserVehicle.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct UserVehicle: Identifiable, Codable {
    @DocumentID var id: String?
    var plate: String
//    var userID: String
    
//    var dictionary: [String: Any] {
//        return [
//            "plate": plate
////            "userID": userID
//        ]
//    }
    
    init(
        plate: String
//        userID: String
    )
    {
        self.plate = plate
//        self.userID = userID
    }
    
//    init?(dictionary: [String: Any]){
//        guard
//            let plate = dictionary["plate"] as? String
////            let userID = dictionary["userID"] as? String
//            else {
//                return nil
//        }
//
//        self.init(
//            plate: plate
////            userID: userID
//        )
//    }
    
}
