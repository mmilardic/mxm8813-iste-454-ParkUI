//
//  Home.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 06/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI
import Firebase

struct Home : View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        VStack{
            if self.status{
                Homescreen()
            } else {
                ZStack{
                    NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                        Text("")
                    }
                    .hidden()
                    Login(show: self.$show)
                }
            }
        }
            //            .navigationBarTitle("")
            //            .navigationBarHidden(true)
            //            .navigationBarBackButtonHidden(true)
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
        }
        
    }
}

struct Homescreen : View {
    
    private enum Tab: String {
        case home = "Home"
        case profile = "Profile"
        case scheduler = "Scheduler"
        case creditCard = "Credit Card"
        
        var iconName: String {
            switch self {
            case .home:
                return "house"
            case .profile:
                return "person.circle.fill"
            case .scheduler:
                return "calendar.badge.plus"
            case .creditCard:
                return "creditcard.fill"
            }
        }
    }
    
    @State private var tabSelection = Tab.home
    
    
    private var navigationBarTitle: String {
        tabSelection == .home ? "ParkUI" : tabSelection.rawValue
    }
    
    var body: some View{
        NavigationView {
            
            TabView(selection: $tabSelection){
                
                //homeScreen
                VStack{
                    //            Text("Logged successfully")
                    //                .font(.title)
                    //                .fontWeight(.bold)
                    //                .foregroundColor(Color.black.opacity(0.7))
                    //
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
                    .tabItem {
                        Image(systemName: Tab.home.iconName)
                        Text(Tab.home.rawValue)
                }
                .tag(Tab.home)
                
                
                //profile
                Text("tralal")
                    .tabItem {
                        Image(systemName: Tab.profile.iconName)
                        Text(Tab.profile.rawValue)
                }
                .tag(Tab.profile)
                
                //scheduler
                Text("tralal")
                    .tabItem {
                        Image(systemName: Tab.scheduler.iconName)
                        Text(Tab.scheduler.rawValue)
                }
                .tag(Tab.scheduler)
                
                //creditCard
                CreditCard()
                    .tabItem {
                        Image(systemName: Tab.creditCard.iconName)
                        Text(Tab.creditCard.rawValue)
                }
                .tag(Tab.creditCard)
                
                
            }//tabView
        }
        .navigationBarTitle(navigationBarTitle)
        //        .navigationBarHidden(tabSelection == Tab.home)
        
    }
}




