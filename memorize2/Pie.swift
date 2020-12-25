//
//  Pie.swift
//  memorize2
//
//  Created by Seungmi Kang on 05/10/1399 AP.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.height, rect.width) / 2
        let start = CGPoint(
            x: center.x + radius + cos(CGFloat(startAngle.radians)),
            y: center.y + radius + sin(CGFloat(startAngle.radians))
        )
        var path = Path()
        path.move(to: center)
        //path.addLine(to: start)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockWise
        )
        //path.addLine(to: center)

        return path
    }
}

