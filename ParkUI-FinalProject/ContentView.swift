//
//  ContentView.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @ObservedObject private var userViewModel = UserViewModel()

    func requestNotificationAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            success ? print("notification success") : print(error?.localizedDescription ?? "")
        }
    }
    
    
    var body: some View {
        NavigationView {
            ViewControler(userViewModel: userViewModel)
        }.onAppear(){
            self.requestNotificationAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
