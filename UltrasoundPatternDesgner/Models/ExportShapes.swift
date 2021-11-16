//
//  ExportShapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/16.
//

import Foundation
import SwiftUI


func exportShapes(_ userShapes: [UserShape]) -> Void {
    var noRect: Int = 0
    var noCir: Int = 0
    var noLine: Int = 0
    
    for shape in userShapes {
        switch shape.shapeCategory {
            case "rectangle":
                noRect += 1
            case "circle":
                noCir += 1
            case "line":
                noLine += 1
            default:
                continue
        }
    }
}
