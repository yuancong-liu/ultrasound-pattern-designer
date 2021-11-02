//
//  DrawObjects.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import Foundation
import SwiftUI


var idUsed = 0

struct UserShape: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isShown: Bool
    var shapeCategory: String
    
    var width: Double
    var height: Double
    
    var centroid: Coordinates
    
    struct Coordinates: Hashable, Codable {
        var x: Double
        var y: Double
        
        init(_ startingPoint: CGPoint, _ endingPoint: CGPoint) {
            x = (startingPoint.x + endingPoint.x) / 2
            y = (startingPoint.y + endingPoint.y) / 2
        }
    }

    var rotation: Double
    
    
    init(_ startingPoint: CGPoint, _ endingPoint: CGPoint, _ shapeCategory: String) {
        self.width = abs(startingPoint.x - endingPoint.x)
        self.height = abs(startingPoint.y - endingPoint.y)

        self.centroid = Coordinates(startingPoint, endingPoint)
        
        self.rotation = 0.0
        
        self.id = idUsed + 1
        idUsed += 1
        self.name = "Obejct" + "\(self.id)"
        self.isShown = true
        self.shapeCategory = shapeCategory
    }
}
