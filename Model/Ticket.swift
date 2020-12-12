//
//  Ticket.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

struct Ticket: Codable, Identifiable {
    @DocumentID var id: String?
    var idForEach = UUID()
    var date: Date
    var durationType: String
    var zona: String
    var duration: String
    
    init(date: Date, durationType: String, zona: String, duration: String) {
        self.date = date
        self.durationType = durationType
        self.zona = zona
        self.duration = duration
    }
}
