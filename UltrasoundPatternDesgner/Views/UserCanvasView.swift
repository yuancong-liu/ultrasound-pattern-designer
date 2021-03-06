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
                    switch shape.shapeCategory {
                        case "circle":
                            drawCircle(shape)
                                .stroke(lineWidth: 3)
                                .foregroundColor(modelData.problematicObjects.contains(shape.id) ? .pink : .black)
                        case "line":
                            drawLine(shape)
                                .stroke(lineWidth: 3)
                                .foregroundColor(modelData.problematicObjects.contains(shape.id) ? .pink : .black)
                        case "rectangle":
                            drawRectangle(shape).stroke(lineWidth: 3)
                                .foregroundColor(modelData.problematicObjects.contains(shape.id) ? .pink : .black)
                        default:
                            drawCircle(shape)
                                .stroke(lineWidth: 3)
                                .foregroundColor(modelData.problematicObjects.contains(shape.id) ? .pink : .black)
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
