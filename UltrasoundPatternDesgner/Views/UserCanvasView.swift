//
//  UserCanvasView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

struct UserCanvas: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(modelData.currentShapes) { shape in
                if shape.isShown {
                    if checkOutside(shape) {
                        switch shape.shapeCategory {
                            case "circle":
                                drawCircle(shape).stroke(lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                            case "line":
                                drawLine(shape).stroke(lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                            case "rectangle":
                                drawRectangle(shape).stroke(lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                            default:
                                drawCircle(shape).stroke(lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                        }
                    } else {
                        Text("\(shape.name) is out of range!")
                            .foregroundColor(Color.pink)
                            .padding()
                        switch shape.shapeCategory {
                            case "circle":
                                drawCircle(shape).stroke(Color.pink, lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                            case "line":
                                drawLine(shape).stroke(Color.pink, lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                            case "rectangle":
                                drawRectangle(shape).stroke(Color.pink, lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                            default:
                                drawCircle(shape).stroke(Color.pink, lineWidth: 3).rotationEffect(.degrees(shape.rotation))
                        }
                    }
                }
            }
        }
    }
}

struct UserCanvas_Previews: PreviewProvider {
    static var previews: some View {
        UserCanvas().environmentObject(ModelData())
    }
}
