//
//  loginView.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 05/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @Binding var index: Int
    
    var body: some View {
        ZStack{
            VStack {
                HStack {
                    VStack(spacing: 10){
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .black : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }//Vstack
                    Spacer(minLength: 0)
                } //hstack
                    .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$viewModel.email)
                        //                        TextField("Email Address", text: viewModel.email)
                    }
                    
                    Divider().background(Color.black.opacity(0.5))
                    
                } //vstack
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Password", text: self.$viewModel.password)
                    }
                    Divider().background(Color.black.opacity(0.5))
                }//Vstack
                    .padding(.horizontal)
                    .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }){
                        Text("Forgot Password?")
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 15)
            } //vstack
                .padding()
                .padding(.bottom, 65)
                .background(Color("Color2"))
                .clipShape(CShapeR())
                .contentShape(CShapeR())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            
            Button(action: {
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 185)
            .opacity(self.index == 0 ? 1 : 0 )
        }//zstack
    }
}


struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        Text("asd")
    }
}
