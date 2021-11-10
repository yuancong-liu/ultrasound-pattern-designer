//
//  UserData.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/2.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var currentShapes = [UserShape]()
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


