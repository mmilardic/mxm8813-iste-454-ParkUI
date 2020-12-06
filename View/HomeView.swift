//
//  Home.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 05/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @State var index = 0
    
    var body: some View {
        GeometryReader {_ in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                ZStack {
                    SignUpView(viewModel: self.viewModel, index: self.$index)
                        .zIndex(Double(self.index))
                    
                    LoginView(viewModel: self.viewModel, index: self.$index)
                    
                }
                
            }//Vstack
                .padding(.vertical)
        }//geomreader
            .background(Color("Color1").edgesIgnoringSafeArea(.all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Text("a")
    }
}
