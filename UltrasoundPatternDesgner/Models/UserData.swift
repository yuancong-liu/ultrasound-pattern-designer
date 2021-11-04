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


//func loadShapes() -> Array<UserShape> {
//
//    var shapesArray = [UserShape]()
//
//    shapesArray.append(UserShape(CGPoint(x: 30, y: 60), CGPoint(x: 40, y: 100), "circle"))
//    shapesArray.append(UserShape(CGPoint(x: 300, y: 400), CGPoint(x: 100, y: 200), "triangle"))
//    shapesArray.append(UserShape(CGPoint(x: 450, y: 80), CGPoint(x: 3800, y: 220), "rectangle"))
//
//    return shapesArray
//}
