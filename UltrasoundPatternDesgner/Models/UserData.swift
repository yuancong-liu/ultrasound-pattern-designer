//
//  UserData.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/2.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var currentShapes = loadShapes()
}


func loadShapes() -> Array<UserShape> {
    
    var shapesArray = [UserShape]()
    
    shapesArray.append(UserShape(CGPoint(x: 30, y: 60), CGPoint(x: 40, y: 100), "circle"))
    shapesArray.append(UserShape(CGPoint(x: 30, y: 60), CGPoint(x: 40, y: 100), "triangle"))
    shapesArray.append(UserShape(CGPoint(x: 30, y: 60), CGPoint(x: 40, y: 100), "rectangle"))
    
    return shapesArray
}
