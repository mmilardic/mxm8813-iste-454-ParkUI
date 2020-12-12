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
import SwiftUI

struct UserVehicle: Identifiable, Codable {
    @DocumentID var id: String?
    var idForEach = UUID()
    var plate: String
    
    init(plate: String)
    {
        self.plate = plate
    }  
}
