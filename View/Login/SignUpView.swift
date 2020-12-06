//
//  Register.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 05/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @Binding var index: Int
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .black : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$viewModel.email)
                    }
                    Divider().background(Color.black.opacity(0.5))
                }//vstack
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Password", text: self.$viewModel.password)
                    }
                    Divider().background(Color.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Reenter Password", text: self.$viewModel.rePassword)
                    }
                    
                    Divider().background(Color.black.opacity(0.5))
                }//vstack
                    .padding(.horizontal)
                    .padding(.top, 20)
            }//vstack
                .padding()
                .padding(.bottom, 65)
                .background(Color("Color2"))
                .clipShape(CShapeL())
                .contentShape(CShapeL())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                .onTapGesture {
                    self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                
            }) {
                Text("Sign up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal , 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            }
                .offset(y: 25)

                //hiding view when its in background
                .opacity(self.index == 1 ? 1 : 0)
            
        }//zstack
    }//body
}

