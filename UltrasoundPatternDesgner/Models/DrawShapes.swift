//
//  DrawShapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/16.
//

import Foundation
import SwiftUI


func drawRectangle(_ userShape: UserShape) -> Path {
    let paths = Path { path in
        path.addRect(CGRect(x: userShape.position.x, y: userShape.position.y, width: userShape.width, height: userShape.height))
    }
    
    return paths
}


func drawLine(_ userShape: UserShape) -> Path {
    let paths =
        userShape.startingPoint == userShape.endingPoint ? Path { path in
            path.addEllipse(in: CGRect(x: userShape.startingPoint.x, y: userShape.startingPoint.y, width: 0, height: 0))
        } : Path { path in
            path.move(to: CGPoint(x: userShape.startingPoint.x, y: userShape.startingPoint.y))
            path.addLine(to: CGPoint(x: userShape.endingPoint.x, y: userShape.endingPoint.y))
        }
    
    return paths
}


func drawCircle(_ userShape: UserShape) -> Path {
    let paths = Path { path in
        path.addEllipse(in: CGRect(x: userShape.position.x, y: userShape.position.y, width: userShape.radius * 2, height: userShape.radius * 2))
    }
    
    return paths
}
