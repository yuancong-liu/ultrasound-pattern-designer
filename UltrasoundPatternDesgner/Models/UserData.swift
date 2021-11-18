//
//  UserData.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/2.
//

import Foundation
import Combine
import SwiftUI

var problematicObjects = [Int]()

final class ModelData: ObservableObject {
    @Published var currentShapes = [UserShape]()
    @Published var problematicObjects = [Int]()
}


func checkOutside(_ userShape: UserShape) -> Bool {
    if userShape.shapeCategory == "circle" {
        if userShape.position.y + userShape.width > 400 {
            return false
        }
    }
    
    if userShape.position.x < 0 {
        return false
    } else if userShape.position.y < 0 {
        return false
    } else if userShape.position.x + userShape.width > 400 {
        return false
    } else if userShape.position.y + userShape.height > 400 {
        return false
    }
    
    return true
}


func checkProblematic(_ modelData: ModelData) -> Void {
    
    modelData.problematicObjects = [Int]()
    
    for userShape in modelData.currentShapes {
        
        if !checkOutside(userShape) {
            modelData.problematicObjects.append(userShape.id)
        }
        
        switch userShape.shapeCategory {
            case "rectangle":
                if userShape.width < 10 || userShape.width > 100 || userShape.height < 10 || userShape.height > 100 || userShape.renderFreq <= 0 {
                    modelData.problematicObjects.append(userShape.id)
                }

            case "circle":
                if userShape.width < 10 || userShape.width > 100 || userShape.renderFreq <= 0 {
                    modelData.problematicObjects.append(userShape.id)
                }
                
            case "line":
                if userShape.startingPoint == userShape.endingPoint || userShape.renderFreq <= 0 {
                    modelData.problematicObjects.append(userShape.id)
                }
                
            default:
                break
        }
    }
}
