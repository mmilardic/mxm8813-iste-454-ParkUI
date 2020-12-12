//
//  CreditCard.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 07/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct CreditCardView: View {
    
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    @State private var editingName = false
    @State private var editingExpiration = false
    @State private var editingCVV = false
    
    @ObservedObject var userViewModel: UserViewModel

    @State private var name: String = ""
    @State private var expiration: String = ""
    @State private var cvv: String = ""
    
    init(userViewModel: UserViewModel){
        self.userViewModel = userViewModel
    }
    
    
    var body: some View {
        VStack (spacing: 4){
            Group {
                if self.flipped {
                    CreditCardBack(cvv: self.userViewModel.currentUser?.creditCard.cvv ?? "cvv not available")
                } else {
                    CreditCardFront(name: self.userViewModel.currentUser?.creditCard.name ?? "name not available", expiration: self.userViewModel.currentUser?.creditCard.expiration ?? "expiration not available")
                }
            }.rotation3DEffect(
                .degrees(self.degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
                .onTapGesture {
                    withAnimation {
                        self.degrees += 180
                        self.flipped.toggle()
                    }
            }
            
            Spacer()
            
            TextField("Name", text: self.$name, onEditingChanged: { edit in
                self.editingName = edit
            }).textFieldStyle(
                MyTextFieldStyle(focused: $editingName)).font(Font.custom("textFieldFont", size: 16))
            TextField("Expiration", text: self.$expiration, onEditingChanged: { edit in
                self.editingExpiration = edit
            }).textFieldStyle(
                MyTextFieldStyle(focused: $editingExpiration)).font(Font.custom("textFieldFont", size: 16))
            TextField("CVV", text: self.$cvv, onEditingChanged: { edit in
                self.editingCVV = edit
            }).textFieldStyle(
                MyTextFieldStyle(focused: $editingCVV)).font(Font.custom("textFieldFont", size: 16))
            
            Spacer()
            
            Button(action: {
                //SAVE action
                self.userViewModel.currentUser?.creditCard.setValues(name: self.name, expiration: self.expiration, cvv: self.cvv)
                self.userViewModel.updateDB()
//                self.name = ""
//                self.expiration = ""
//                self.cvv = ""
            }) {
                Text("Save")
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

struct CreditCardFront: View {
    
    private var name: String
    private var expiration: String
    
    init(name: String, expiration: String){
        self.name = name
        self.expiration = expiration
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("VISA")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }.padding()
            
            Spacer()
            
            Text("**** **** **** 2864")
                .foregroundColor(Color.white)
                .font(.system(size: 32))
                .padding()
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading){
                    Text("Card HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    Text(self.name.count == 0 ? "John Doe" : self.name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                
                VStack {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(self.expiration.count == 0 ? "01/25" : self.expiration )
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
            }.padding()
            
        }.frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}

struct CreditCardBack: View {
    
    private var cvv: String
    
    init(cvv: String){
        self.cvv = cvv
    }
    
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: CGFloat(20))
                .padding([.top])
            
            Spacer()
            
            HStack {
                Text(self.cvv.isNumeric && self.cvv.count < 4 ? self.cvv : "123").foregroundColor(Color.black)
                    .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20)
                    .background(Color.white)
                
                Spacer()
            }
            .padding()
            
        }
        .frame(width: 300, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    @Binding var focused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(focused ? Color.blue : Color.gray, lineWidth: 2)
        ).padding(4)
    }
}


extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}
