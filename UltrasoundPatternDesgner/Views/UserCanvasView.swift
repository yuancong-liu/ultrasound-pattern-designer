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
                switch shape.shapeCategory {
                    case "circle":
                        drawCircle(shape).stroke(lineWidth: 3)
                    case "triangle":
                        drawTriangle(shape).stroke(lineWidth: 3)
                    case "rectangle":
                        drawRectangle(shape).stroke(lineWidth: 3)
                    default:
                        drawCircle(shape).stroke(lineWidth: 3)
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
