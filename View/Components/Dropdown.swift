//
//  Dropdown.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 12/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct DropDown : View {
    
    @State var expand = false
    var selectValues: [String]
//    @State var selectedValue: String
    @Binding var valueBinding: String
    
    init(selectValues: [String], binding: Binding<String>){
        self.selectValues = selectValues
//        _selectedValue = State(initialValue: selectValues[0])
        _valueBinding = binding
    }
    
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10, content: {
            
            HStack {
                Text("\(self.valueBinding)").fontWeight(.heavy).foregroundColor(.white)
                
                Image(systemName: expand ? "chevron.up" : "chevron.down").resizable().frame(width: 12, height: 6)
                    .foregroundColor(.white)
            }.onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                Button(action: {
//                    self.selectedValue = self.selectValues[0]
                    self.valueBinding = self.selectValues[0]
                    self.expand.toggle()
                }) {
                    Text("\(self.selectValues[0])")
                }.foregroundColor(.white)
                
                Button(action: {
//                    self.selectedValue = self.selectValues[1]
                    self.valueBinding = self.selectValues[1]
                    self.expand.toggle()
                }) {
                    Text("\(self.selectValues[1])")
                }.foregroundColor(.white)
                
                Button(action: {
//                    self.selectedValue = self.selectValues[2]
                    self.valueBinding = self.selectValues[2]
                    self.expand.toggle()
                }) {
                    Text("\(self.selectValues[2])")
                }.foregroundColor(.white)
            }
            
        })//vstack
            .padding()
            .background(LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .animation(.spring())
    }
}


