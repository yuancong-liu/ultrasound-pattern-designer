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
                        using Seconds = std::chrono::duration;<float>;
                        static auto start_time = std::chrono::steady_clock::now();
                        
                        \n
                        
                        """.data(using: .ascii)!)
    
    var flagRect: Bool = false
    var flagCir: Bool = false
    var flagLine: Bool = false
    
    for shape in userShapes {
        switch shape.shapeCategory {
            case "rectangle":
                if !flagRect {
                    flagRect = true
                    fileHandle.write("""
                                        struct Rectangle
                                        {
                                            Ultrahaptics::Vector3 position;
                                            
                                            float intensity;
                                            
                                            float frequency;
                                            
                                            float width;
                                            float height;
                                            float topLeftX;
                                            float topLeftY;
                                            
                                            const Ultrahaptics::Vector3 evaluateAt(Seconds t){
                                                float period = 1 / frequency;
                                                float halfPeriod = period / 2;
                                                float coef = (width + height) / halfPeriod;
                                                float tInPeriod = t.count() % period;
                                                
                                                if (tInPeriod >= 0 && tInPeriod <  halfPeriod) {
                                                    if (position.x < width + topLeftX) {
                                                        position.x = coef * tInPeriod + topLeftX;
                                                        position.y = topLeftY;
                                                    } else {
                                                        position.x = width + topLeftX;
                                                        position.y = -height + coef * tInPeriod + topLeftY;
                                                    }
                                                } else {
                                                    if (position.x > topLeftX) {
                                                        position.x = 2 * width + height - coef * tInPeriod + topLeftX;
                                                        position.y = height + topLeftY;
                                                    } else {
                                                        position.x = topLeftX;
                                                        position.y = 2 * width + 2 * height - coef * tInPeriod + topLeftY;
                                                    }
                                                }
                                                return position;
                                            }
                                        };
                                        
                                        void emitter_callback_rectangle(const Ultrahaptics::TimePointStreaming::Emitter &timepoint_emitter,
                                        Ultrahaptics::TimePointStreaming::OutputInterval &interval,
                                        const Ultrahaptics::HostTimePoint &submission_deadline,
                                        void *user_pointer)
                                        {
                                            Rectangle *rectangle = static_cast<Rectangle*>(user_pointer);
                                            
                                            for (auto& sample : interval) {
                                                const Seconds t = sample - start_time;
                                                const Ultrahaptics::Vector3 position = rectangle->evaluateAt(t);
                                                
                                                sample.persistentControlPoint(0).setPosition(position);
                                                sample.persistentControlPoint(0).setIntensity(rectangle->intensity);
                                            }
                                        }
                                        \n\n\n
                                        """.data(using: .ascii)!)
                }
                
            case "circle":
                if !flagCir {
                    flagCir = true
                    fileHandle.write("""
                                        struct Circle
                                        {
                                            Ultrahaptics::Vector3 position;
                                            
                                            float intensity;
                                            
                                            float frequency;
                                            
                                            float radius;
                                            float centreX;
                                            float centreY;
                                            
                                            const Ultrahaptics::Vector3 evaluateAt(Seconds t){
                                                position.x = std::cos(2 * M_PI * frequency * t.count()) * radius + centerX;
                                                position.y = std::sin(2 * M_PI * frequency * t.count()) * radius + centreY;
                                                return position;
                                            }
                                        };
                                        
                                        // callback functions
                                        void emitter_callback_circle(const Ultrahaptics::TimePointStreaming::Emitter &timepoint_emitter,
                                        Ultrahaptics::TimePointStreaming::OutputInterval &interval,
                                        const Ultrahaptics::HostTimePoint &submission_deadline,
                                        void *user_pointer)
                                        {
                                            Circle *circle = static_cast<Circle*>(user_pointer);
                                            
                                            for (auto& sample : interval) {
                                                const Seconds t = sample - start_time;
                                                const Ultrahaptics::Vector3 position = circle->evaluateAt(t);
                                                
                                                sample.persistentControlPoint(0).setPosition(position);
                                                sample.persistentControlPoint(0).setIntensity(circle->intensity);
                                            }
                                        }
                                        \n\n\n
                                        """.data(using: .ascii)!)
                }
            case "line":
                if !flagLine {
                    flagLine = true
                    fileHandle.write("""
                                        struct Line
                                        {
                                            Ultrahaptics::Vector3 position;
                                            
                                            float intensity;
                                            
                                            float frequency;
                                            
                                            float startingX;
                                            float startingY;
                                            float endingX;
                                            float endingY;
                                            
                                            const Ultrahaptics::Vector3 evaluateAt(Seconds t){
                                                float period = 1 / frequency;
                                                float halfPeriod = period / 2;
                                                float coefX = (endingX - startingX) / halfPeriod;
                                                float coefY = (endingY - startingY) / halfPeriod;
                                                float tInPeriod = t.count() % period;
                                                
                                                if (tInPeriod >= 0 && tInPeriod < halfPeriod) {
                                                    position.x = startingX + coefX * tInPeriod;
                                                    position.y = startingY + coefY * tInPeriod;
                                                } else {
                                                    position.x = endingX - coefX * tInPeriod;
                                                    position.y = endingY - coefY * tInPeriod;
                                                }
                                                return position;
                                            }
                                        };
                                        
                                        void emitter_callback_line(const Ultrahaptics::TimePointStreaming::Emitter &timepoint_emitter,
                                        Ultrahaptics::TimePointStreaming::OutputInterval &interval,
                                        const Ultrahaptics::HostTimePoint &submission_deadline,
                                        void *user_pointer)
                                        {
                                            Line *line = static_cast<Line*>(user_pointer);
                                            
                                            for (auto& sample : interval) {
                                                const Seconds t = sample - start_time;
                                                const Ultrahaptics::Vector3 position = line->evaluateAt(t);
                                                
                                                sample.persistentControlPoint(0).setPosition(position);
                                                sample.persistentControlPoint(0).setIntensity(line->intensity);
                                            }
                                        }
                                        \n\n\n
                                        """.data(using: .ascii)!)
                }
            default:
                continue
        }
    }
    
    try? fileHandle.close()
    
    print(NSHomeDirectory())
    
    NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: path)

}
