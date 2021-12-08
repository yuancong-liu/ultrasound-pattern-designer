//
//  UserShapes.swift
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
    var radius: Double
    
    var position: Coordinates
    var startingPoint: Coordinates
    var endingPoint: Coordinates
    var centre: Coordinates
    
    var positionZ: Double
    
    struct Coordinates: Hashable, Codable {
        var x: Double
        var y: Double
        
        init(_ userX: Double, _ userY: Double) {
            x = userX
            y = userY
        }
    }

    var direction: Bool
    var renderFreq: Int
    
    var problematic: Bool
    
    mutating func setShown() {
        self.isShown = !self.isShown
    }
    
    
    init(_ startingPoint: CGPoint, _ endingPoint: CGPoint, _ shapeCategory: String) {
        self.width = abs(startingPoint.x - endingPoint.x)
        self.height = abs(startingPoint.y - endingPoint.y)
        self.radius = width / 2
        
        // check if width and height is in the range
        if self.width > 100 {
            self.width = 100
        }
        
        if self.width < 10 {
            self.width = 10
        }
        
        
        if self.height > 100 {
            self.height = 100
        }
        if self.height < 10 {
            self.height = 10
        }
        
        self.startingPoint = Coordinates(startingPoint.x, startingPoint.y)
        self.endingPoint = Coordinates(endingPoint.x, endingPoint.y)
        self.centre = Coordinates((startingPoint.x + endingPoint.x) / 2, (endingPoint.y - startingPoint.y) / 2)

        self.position = Coordinates(min(self.startingPoint.x, self.endingPoint.x), min(self.startingPoint.y, self.endingPoint.y))
        self.positionZ = 100
        
        self.direction = true
        self.renderFreq = 17
        
        self.problematic = false
        
        self.id = idUsed + 1
        idUsed += 1
        self.name = "Obejct" + "\(self.id)"
        self.isShown = true
        self.shapeCategory = shapeCategory
    }
    
    func checkOverlap() -> Bool {
        if self.startingPoint == self.endingPoint {
            return true
        }
        return false
    }
}

func clearCanvas(_ modelData: ModelData) -> Void {
    modelData.currentShapes = [UserShape]()
    modelData.problematicObjects = [Int]()
}
