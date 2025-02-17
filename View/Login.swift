//
//  Login.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 06/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI
import Firebase


struct Login : View {
    
    
    @ObservedObject var userViewModel: UserViewModel
    
    @State var color: Color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var pass: String = ""
    @State var visible: Bool = false
    @Binding var show : Bool
    @State var alert: Bool = false
    @State var error: String = ""
    
    init(userViewModel: UserViewModel, show: Binding<Bool>){
        self.userViewModel = userViewModel
        self._show = show
    }
    
    var body: some View{
        
        ZStack{
            
            ZStack(alignment: .topTrailing) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        Image("ParkingLogo")
                            .resizable()
                            .frame(width: 150, height: 150)
                        
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.visible{
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                                else{
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                self.reset()
                            }) {
                                Text("Forget password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        
                        Button(action: {
                            self.verify()
                        }) {
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
                
                Button(action: {
                    self.show.toggle()
                }) {
                    
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            
            if self.alert{
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
    private func verify(){
        if self.email != "" && self.pass != ""{
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                
                guard let userUID = Auth.auth().currentUser?.uid else {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                FirebaseHandler().getUserSnapshot(userUID: userUID) { documentSnapshot in
                    CredentialsRepository.shared.setValue(value: self.email, for: .email)
                    CredentialsRepository.shared.setValue(value: self.pass, for: .password)
                }
                
                print("Logged in: success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        } else {
            self.error = "Please fill out the fields"
            self.alert.toggle()
        }
    }
    
    func reset(){
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
}
