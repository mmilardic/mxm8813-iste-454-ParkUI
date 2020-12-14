//
//  Scheduler.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 11/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI
import UserNotifications

struct Scheduler: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    @State var date = Date()
    @State var data: DateType!
    @State var expand = false
    @State var year = false
    @State private var showingAlert = false
    
    //bindings
    @State var durationType: String = "Hourly"
    @State var zona: String = "Zona 1"
    @State var duration: String = "1"
    
    private func scheduleTicket(){
            let content = UNMutableNotificationContent()
        content.title = "Ticket purchased"
        content.subtitle = "ParkUI Ticket"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    var body: some View {
        GeometryReader{_ in
            VStack(spacing: 10) {
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
                        .shadow(radius: 4, x: 10, y:10)
                        .padding(.bottom, 8)
                }
                                
                DropDown(selectValues:  ["Hourly", "Daily", "Monthly"], binding: self.$durationType)
                DropDown(selectValues:  ["Zona 1", "Zona 2", "Zona 3"], binding: self.$zona)
                DropDown(selectValues:  ["1", "2", "3"], binding: self.$duration)
                                                                
                Button(action: {
                    let newTicket = Ticket(date: self.date,
                                           durationType: self.durationType,
                                           zona: self.zona,
                                           duration: self.duration)
                    print(self.zona)
                    self.userViewModel.addTicket(ticket: newTicket)
                    if !(Calendar.current.isDateInToday(self.date)){
                        self.scheduleTicket()
                    }
                    self.showingAlert = true
                }) {
                    Text("Buy ticket")
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
                .alert(isPresented: self.$showingAlert){
                    Alert(title: Text("You have bought a ticket."),
                          message: Text("You will find all your tickets on the home tab."),
                          dismissButton: .default(Text("Got it!")))
                }
                
                Spacer()

            }//vstack
            .padding()
                .padding(.bottom, 15)
        }//geometryReader
            .edgesIgnoringSafeArea(.all)
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

