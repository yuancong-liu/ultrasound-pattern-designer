//
//  ExportShapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/16.
//

import Foundation
import SwiftUI


func exportShapes(_ userShapes: [UserShape]) -> Void {
    let path = "test.cpp"
    FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
    
    let fileHandle = FileHandle(forWritingAtPath: path)!
    fileHandle.seekToEndOfFile()
    
    
    fileHandle.write("""
                        #include <cmath>
                        #include <iostream>
                        #include <chrono>
                        #include <thread>
                        #include <string>
                        
                        #include "UltrahapticsTimePointStreaming.hpp"
                        
                        #ifndef M_PI
                        #define M_PI 3.14159265358979323
                        #endif
                        
                        using Seconds = std::chrono::duration;<float>;
                        
                        static auto start_time = std::chrono::steady_clock::now();
                        
                        // Structure for passing information on the type of point to create
                        struct Circle
                        {
                            // The position of the control point
                            Ultrahaptics::Vector3 position;
                            
                            // The intensity of the control point
                            float intensity;
                            
                            // The radius of the circle
                            float radius;
                            
                            // The frequency at which the control point goes around the circle
                            float frequency;
                            
                            
                            const Ultrahaptics::Vector3 evaluateAt(Seconds t){
                                // Calculate the x and y positions of the circle and set the height
                                position.x = std::cos(2 * M_PI * frequency * t.count()) * radius;
                                position.y = std::sin(2 * M_PI * frequency * t.count()) * radius;
                                return position;
                            }
                        };\n
                        """.data(using: .ascii)!)
    
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
    
    try? fileHandle.close()
    
//    if let content = try? String(contentsOfFile: path, encoding: .utf8) {
//        print(content)
//    }

    
    
}
