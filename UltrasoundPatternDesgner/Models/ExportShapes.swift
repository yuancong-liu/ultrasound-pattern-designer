//
//  ExportShapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/16.
//

import Foundation
import SwiftUI


func exportShapes(_ userShapes: [UserShape]) -> Void {
    let path = "test.txt"
    FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
    
    let fileHandle = FileHandle(forWritingAtPath: path)!
    fileHandle.seekToEndOfFile()
    
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
    
    fileHandle.write("There are \(noRect) rectangles.\n".data(using: .ascii)!)
    fileHandle.write("There are \(noCir) circles.\n".data(using: .ascii)!)
    fileHandle.write("There are \(noLine) lines.\n".data(using: .ascii)!)
    
    try? fileHandle.close()
    
//    if let content = try? String(contentsOfFile: path, encoding: .utf8) {
//        print(content)
//    }

    
    
}
