//
//  Circle.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct Circle: Shape {
    let radius: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360.0), clockwise: false)
        return path
    }
}
