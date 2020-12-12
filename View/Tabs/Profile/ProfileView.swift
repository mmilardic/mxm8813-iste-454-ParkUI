//
//  ProfileView.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 09/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    @State private var email: String = "test@gmail.com"
    @State private var numberPlate: String = ""
    @State private var editing = false
    
    init(userViewModel: UserViewModel){
        self.userViewModel = userViewModel
    }
    
    var body: some View {
        VStack {
            Text("Email: \(self.userViewModel.currentUser?.email ?? "user email not found")")
                .font(.headline)
                .bold()
                .padding()
                .background(Color("Color"))
                .foregroundColor(Color.black)
                .cornerRadius(10)
            
            Spacer()
            
            List {
                ForEach(userViewModel.currentUser?.userVehicle ?? [], id: \.idForEach) {
                    UserVehicleRowView(vehicle: $0)
                }
                .onDelete(perform: userViewModel.deleteUserVehicle)
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            
            Spacer()
            
            TextField("Number Plate", text: self.$numberPlate, onEditingChanged: { edit in
                self.editing = edit
            }).textFieldStyle(
                MyTextFieldStyle(focused: $editing)).font(Font.custom("textFieldFont", size: 16))
            
            Button(action: {
                //add vehicle action
                let newUserVehicle = UserVehicle(plate: self.numberPlate)
                self.userViewModel.addUserVehicle(userVehicle: newUserVehicle)
                self.numberPlate = ""
            }) {
                Text("Add new vehicle")
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
            
            Spacer()
            
        }.padding()
    }
}
