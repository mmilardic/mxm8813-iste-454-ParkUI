//
//  User.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var username: String
    var firstName: String
    var lastName: String
    var password: String
    var userVehicle: [UserVehicle]
    
    
    
//    enum CodingKeys: String, CodingKey {
//        case username
//        case firstName
//        case lastName
//        case password
//    }
    
//    var dictionary: [String: Any] {
//        return [
//            "username": username,
//            "firstName": firstName,
//            "lastName": lastName,
//            "password": password
//        ]
//    }
    
    init(username: String,
         firstName: String,
         lastName: String,
         password: String,
         userVehicle: [UserVehicle])
    {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.userVehicle = userVehicle
    }
    
//    init?(dictionary: [String: Any]){
//        guard
//            let username = dictionary["username"] as? String,
//            let firstName = dictionary["firstName"] as? String,
//            let lastName = dictionary["lastName"] as? String,
//            let password = dictionary["password"] as? String
//            else {
//                return nil
//        }
//
//        self.init(username: username,
//                  firstName: firstName,
//                  lastName: lastName,
//                  password: password,
//                  userVehicle: userVehi )
//
//    }
    
}
