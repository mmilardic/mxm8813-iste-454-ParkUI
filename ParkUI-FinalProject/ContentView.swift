//
//  ContentView.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 18/11/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = UserViewModel()


    var body: some View {
        NavigationView {
//            HomeView(viewModel: viewModel)
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
