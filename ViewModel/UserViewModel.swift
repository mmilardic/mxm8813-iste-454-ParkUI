//
//  User.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation
import Firebase
import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var rePassword = ""
    
    var ref: DocumentReference? = nil

    
    func getUsers(){
        FirebaseHandler.firestore.collection("users").getDocuments { (querySnapshot, err) in
            if err != nil {
                print ("error")
            }
            else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID)")
                }
            }
        }
//        let user =   User(username: "testUser", firstName: "John", lastName: "Doe", password: "pass")
//        addUser(user: user)
//        print(getUser(documentID: "cF5tuz4vmyeDv0hvp3P"))
        print("User")
        print(FirebaseHandler.users.document("cF5tuz4vmyeDv0hvp3P"))
    }
    
    func getUser(documentID: String) {
//        return FirebaseHandler.users.document(documentID)
//         let user = User(dictionary: FirebaseHandler.users.document(documentID))
//        return user
    }
    
    func addUser(user: User){
        ref = FirebaseHandler.users.addDocument(data: user.dictionary) {
            err in
            if let err = err {
                print("Error adding document: \(err)") }
            else {
                print("User added with ID: \(self.ref?.documentID)")
            }
        }
    }
}
