//
//  Home.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 13/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI
import Firebase


struct Home: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        //homeScreen
        VStack{
            
            Text("History")
                .font(.system(size: 30, weight: .heavy, design: .default))
            
            List {
                ForEach(userViewModel.currentUser?.userTickets ?? [], id: \.idForEach) {
                    UserTicketRowView(ticket: $0)
                }
                .onDelete(perform: userViewModel.deleteTicket)
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                
                Text("Log out")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
        }//vstack
            .padding()
    }
}
