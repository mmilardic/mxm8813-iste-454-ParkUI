//
//  TabCreator.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 13/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI


struct TabCreator : View {
    
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
    @ObservedObject var userViewModel: UserViewModel
    
    private var navigationBarTitle: String {
        tabSelection == .home ? "ParkUI" : tabSelection.rawValue
    }
    
    init(userViewModel: UserViewModel){
        self.userViewModel = userViewModel
    }
    
    var body: some View{            
            TabView(selection: $tabSelection){
                
                //home
                Home(userViewModel: self.userViewModel)
                    .tabItem {
                        Image(systemName: Tab.home.iconName)
                        Text(Tab.home.rawValue)
                }
                .tag(Tab.home)
                
                //scheduler
                Scheduler(userViewModel: self.userViewModel)
                    .tabItem {
                        Image(systemName: Tab.scheduler.iconName)
                        Text(Tab.scheduler.rawValue)
                }
                .tag(Tab.scheduler)
                .navigationBarTitle("Scheduler")
                
                
                //profile
                ProfileView(userViewModel: self.userViewModel)
                    .tabItem {
                        Image(systemName: Tab.profile.iconName)
                        Text(Tab.profile.rawValue)
                }
                .tag(Tab.profile)
                
                //creditCard
                CreditCardView(userViewModel: self.userViewModel)
                    .tabItem {
                        Image(systemName: Tab.creditCard.iconName)
                        Text(Tab.creditCard.rawValue)
                }
                .tag(Tab.creditCard)
                
            }//tabView
        .navigationBarTitle(navigationBarTitle)
    }
    
}

