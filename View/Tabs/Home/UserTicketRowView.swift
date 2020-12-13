//
//  UserTicketRowView.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 13/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct UserTicketRowView: View {
    
    var ticket: Ticket
    @State private var shouldShow = false
    @State var expiryDate: Date = Date()
    
    static let dateFormatLong: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    static let dateFormatWOTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .full
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dd-MM-YYYY"
//    formatter.string(from: self.date)
    
    private func foo(var1: String) -> Double {
        switch ticket.durationType {
        case "Hourly":
            return (Double(ticket.duration) ?? Double(1)) * 3600
        case "Daily":
            return (Double(ticket.duration) ?? Double(1)) * 86400
        case "Monthly":
            return (Double(ticket.duration) ?? Double(1)) * 2629743
        default:
            print("duration type does not exist")
            return Double(0)
        }
        
    }
    
    
    private func calculateExpiryDate() {
        let ticketDate = ticket.date
        
        var newExpirtyDate = ticket.date.addingTimeInterval(foo(var1: ticket.durationType))
        print(newExpirtyDate)
        self.expiryDate = newExpirtyDate
    }
    
    var body: some View {
        HStack (alignment: .top){
            VStack(alignment: .leading, spacing: 4) {
                Text("\(ticket.date, formatter: Self.dateFormatLong)")
                    .font(.headline)
                Text("\(ticket.zona)")
                Text("Expires: \(self.expiryDate, formatter: Self.dateFormatWOTime)")
                    .onAppear(){
                        self.calculateExpiryDate()
                }
            }
            
            Spacer()
            
            Image("ticket")
                .resizable()
            .frame(width: 35, height: 35)
                .scaleEffect(shouldShow ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        self.shouldShow = true
                    }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(radius: 4)
        )
    }
}
