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
    
    var position: Coordinates
    var startingPoint: Coordinates
    var endingPoint: Coordinates
    
    struct Coordinates: Hashable, Codable {
        var x: Double
        var y: Double
        
        init(_ userX: Double, _ userY: Double) {
            x = userX
            y = userY
        }
    }

    var rotation: Double
    var direction: Bool
    var renderFreq: Int
    
    mutating func setShown() {
        self.isShown = !self.isShown
    }
    
    
    init(_ startingPoint: CGPoint, _ endingPoint: CGPoint, _ shapeCategory: String) {
        self.width = abs(startingPoint.x - endingPoint.x)
        self.height = abs(startingPoint.y - endingPoint.y)
        
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

        self.position = Coordinates(min(self.startingPoint.x, self.endingPoint.x), min(self.startingPoint.y, self.endingPoint.y))
        
        self.rotation = 0.0
        self.direction = true
        self.renderFreq = 17
        
        self.id = idUsed + 1
        idUsed += 1
        self.name = "Obejct" + "\(self.id)"
        self.isShown = true
        self.shapeCategory = shapeCategory
    }
}


func drawRectangle(_ userShape: UserShape) -> Path {
    let paths = Path { path in
        path.addRect(CGRect(x: userShape.position.x, y: userShape.position.y, width: userShape.width, height: userShape.height))
    }
    
    return paths
}

func drawLine(_ userShape: UserShape) -> Path {
    let paths = Path { path in
        path.move(to: CGPoint(x: userShape.startingPoint.x, y: userShape.startingPoint.y))
        path.addLine(to: CGPoint(x: userShape.endingPoint.x, y: userShape.endingPoint.y))
    }
    
    return paths
}

func drawCircle(_ userShape: UserShape) -> Path {
    let paths = Path { path in
        path.addEllipse(in: CGRect(x: userShape.position.x, y: userShape.position.y, width: userShape.width, height: userShape.width))
    }
    
    return paths
}
