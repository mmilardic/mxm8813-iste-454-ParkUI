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
    var email: String
    var userVehicle: [UserVehicle]
    var userTickets: [Ticket]
    var creditCard: CreditCard
    
    init(email: String)
    {
        self.email = email
        self.userVehicle = []
        self.userTickets = []
        self.creditCard = CreditCard(name: "ChangeMe", expiration: "ChangeMe", cvv: "121")
    }
        
}
