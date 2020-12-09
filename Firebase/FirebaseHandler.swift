//
//  FirebaseHandler.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHandler {
    static let firestore = Firestore.firestore()
    static let users = firestore.collection("users")
    
    enum FirestoreTables: String {
        case Users = "users"
    }
    
    func getUserSnapshot(userUID: String, completion: @escaping (_ documentSnapshot: DocumentSnapshot) -> Void){
        
    FirebaseHandler.firestore.collection(FirestoreTables.Users.rawValue).document(userUID).addSnapshotListener {
            (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                print("No documents")
                return
            }
            
            completion(document)
            
        }
    }
}
