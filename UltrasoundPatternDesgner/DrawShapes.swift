//
//  Shapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import Foundation
import SwiftUI

class Shapes {
    var centroid: CGPoint
    
    var width: CGFloat
    var height: CGFloat
    
    var rotation: Angle
    
    // initialiser
    init(_ startingPoint: CGPoint, _ endingPoint: CGPoint) {
        self.width = abs(startingPoint.x - endingPoint.x)
        self.height = abs(startingPoint.y - endingPoint.y)
        
        self.centroid = CGPoint(
            x: (startingPoint.x + endingPoint.x) / 2,
            y: (startingPoint.y + endingPoint.y) / 2
        )
        
        self.rotation = .degrees(0)
    }
    
}
