//
//  Home.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 06/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI
import Firebase

struct ControllerView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    init(userViewModel: UserViewModel){
        self.userViewModel = userViewModel
    }
    
    private func getUser() {
        if !(CredentialsRepository.shared.getValue(for: .email).isEmpty && CredentialsRepository.shared.getValue(for: .password).isEmpty) {
            
            guard let userUID = Auth.auth().currentUser?.uid else {
                fatalError("No used UID")
            }
            
            FirebaseHandler().getUserSnapshot(userUID: userUID) { (documentSnapshot) in
                self.userViewModel.currentUser = try? documentSnapshot.data(as: User.self)
                print("got it")
            }
        }
    }
    
    var body: some View{
        VStack{
            //korisnik je vec ulogiran
            if self.status{
                TabCreator(userViewModel: self.userViewModel)
                    .onAppear(){
                        self.getUser()
                }
            } else {
                ZStack{
                    NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                        Text("")
                    }
                    .hidden()
                    Login(userViewModel: self.userViewModel, show: self.$show)
                }
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
        }
    }
}



