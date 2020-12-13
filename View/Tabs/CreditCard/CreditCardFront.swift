//
//  CreditCardFront.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 12/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

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
                    Text("VALID THRU")
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
