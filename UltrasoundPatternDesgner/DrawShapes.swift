//
//  Shapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import Foundation
import SwiftUI

var testList = [Shapes]()
var idUsed = 0

class Shapes {
    
    
    var id: Int
    var name: String
    var category: Category
    var isShown: Bool
    
    enum Category: CaseIterable, Codable, Hashable {
        case cir
        case tri
        case squ
    }
    
    
    var centroid: CGPoint
    
    var width: CGFloat
    var height: CGFloat
    
    var rotation: Angle
    
    // initialiser
    init(_ startingPoint: CGPoint, _ endingPoint: CGPoint, _ category: Category) {
        self.width = abs(startingPoint.x - endingPoint.x)
        self.height = abs(startingPoint.y - endingPoint.y)
        
        self.centroid = CGPoint(
            x: (startingPoint.x + endingPoint.x) / 2,
            y: (startingPoint.y + endingPoint.y) / 2
        )
        
        self.rotation = .degrees(0)
        
        self.id = idUsed + 1
        idUsed += 1
        self.name = "Obejct"
        self.category = category
        self.isShown = true
    }
    
}
