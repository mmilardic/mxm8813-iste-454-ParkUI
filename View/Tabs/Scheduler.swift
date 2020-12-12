//
//  Scheduler.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 11/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

//

import SwiftUI

struct Scheduler: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    @State var date = Date()
    @State var data: DateType!
    @State var expand = false
    @State var year = false
    
    let onSelect = { key in
        print(key)
    }
    
    var body: some View {
        GeometryReader{_ in
            VStack(spacing: 8) {
                if self.data != nil{
                
                    ZStack {
                        VStack(spacing: 15){
                            
                            ZStack {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Text(self.data.Month)
                                        .font(.title)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.vertical)
                                
                                HStack {
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .month, value: -1, to: self.date)!
                                        
                                        self.updateDate()
                                    }) {
                                        Image(systemName: "arrow.left")
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
                                        
                                        self.updateDate()
                                        
                                    }) {
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                            }
                            .background(Color("Color"))
                            
                            
                            
                            Text(self.data.Date)
                                .font(.system(size: 65))
                                .fontWeight(.bold)
                            
                            Text(self.data.Day)
                                .font(.title)
                            
                            Divider()
                            
                            ZStack {
                                
                                Text(self.data.Year)
                                    .font(.title)
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation(.default){
                                            self.expand.toggle()
                                        }
                                        
                                    }) {
                                        Image(systemName: "chevron.right")
                                            .renderingMode(.original)
                                            .resizable()
                                            .frame(width: 10, height: 16)
                                            .rotationEffect(.init(degrees:  self.expand ? 270 : 90))
                                    }
                                    .padding(.trailing, 30)
                                    
                                }
                                
                            }
                            
                            if self.expand {
                                Toggle(isOn: self.$year) {
                                    Text("Year")
                                        .font(.title)
                                }
                                .padding(.trailing, 15)
                                .padding(.leading, 25)
                            }
                        }
                        .padding(.bottom, self.expand ? 15 : 12)
                        
                        
                        HStack {
                            Button(action: {
                                
                                self.date = Calendar.current.date(byAdding: self.year ? .year : .day, value: -1, to: self.date)!
                                
                                self.updateDate()
                                
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.date = Calendar.current.date(byAdding: self.year ? .year : .day, value: 1, to: self.date)!
                                
                                self.updateDate()
                                
                            }) {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal, 30)
                        
                    }
                        //                        .border(Color.black, width: 0.5)
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 5, x: 20, y:20)
                }

                DropDown(selectValues:  ["Hourly", "Daily", "Monthly"])
                DropDown(selectValues:  ["Zona 1", "Zona 2", "Zona 3"])
                DropDown(selectValues:  ["Zone 1", "Zone 2", "Zone 3"])
                
                Button(action: {
         
                }) {
                    Text("Buy ticket")
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                
                Spacer()
            }//vstack
        }//geometryReader
            .edgesIgnoringSafeArea(.all)
            
            //            .onTapGesture {
            //                 let formatter = DateFormatter()
            //                formatter.dateFormat = "dd-MM-YYYY"
            //                print(formatter.string(from: self.date))
            //        }
            .onAppear {
                self.updateDate()
        }
    }
    
    func updateDate(){
        let current = Calendar.current
        
        let date = current.component(.day, from: self.date)
        let monthNO = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNO - 1]
        let year = current.component(.year, from: self.date)
        let weekNO = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weekNO - 1]
        
        
        self.data = DateType(Day: day, Date: "\(date)", Year: "\(year)", Month: month)
    }
}

struct DateType {
    var Day: String
    var Date: String
    var Year: String
    var Month: String
}

struct DropDown : View {
    
    @State var expand = false
    var selectValues: [String]
    @State var selectedValue: String
    
    init(selectValues: [String]){
        self.selectValues = selectValues
        _selectedValue = State(initialValue: selectValues[0])
    }
    
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10, content: {
            
            HStack {
                Text("\(self.selectedValue)").fontWeight(.heavy).foregroundColor(.white)
                
                Image(systemName: expand ? "chevron.up" : "chevron.down").resizable().frame(width: 12, height: 6)
                    .foregroundColor(.white)
            }.onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                Button(action: {
                    self.selectedValue = self.selectValues[0]
                    self.expand.toggle()
                }) {
                    Text("\(self.selectValues[0])")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.selectedValue = self.selectValues[1]
                    self.expand.toggle()
                }) {
                    Text("\(self.selectValues[1])")
                }.foregroundColor(.white)
                
                Button(action: {
                    self.selectedValue = self.selectValues[2]
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


