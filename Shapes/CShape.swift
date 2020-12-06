//
//  CShape.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 05/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import SwiftUI


struct CShapeR: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            // right side curve
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShapeL: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            // left side curve
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}
