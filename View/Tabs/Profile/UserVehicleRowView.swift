//
//  UserVehicleRowView.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 09/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI

struct UserVehicleRowView: View {

    var vehicle: UserVehicle
    @State private var shouldShow = false
////
//    private var carIcon: String {
//        note.favorite ? "car.fill" : "car"
//    }
//
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(vehicle.plate)
                    .font(.headline)
            }
            
            Spacer()
            
            Image(systemName: "car.fill")
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

