//
//  CreditCardBack.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 12/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

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
