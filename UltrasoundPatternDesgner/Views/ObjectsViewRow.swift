//
//  ObjectsViewRow.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/11/3.
//

import SwiftUI

struct ObjectsViewRow: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var userShape: UserShape
    
    var body: some View {
        HStack {
            switch userShape.shapeCategory {
                case "circle":
                    Image(systemName: "circle.fill")
                        .imageScale(.medium)
                case "triangle":
                    Image(systemName: "triangle.fill")
                        .imageScale(.medium)
                case "rectangle":
                    Image(systemName: "square.fill")
                        .imageScale(.medium)
                default:
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
            }
            
            Text(userShape.name)
            Spacer()
            Button(action: {
                modelData.currentShapes.removeAll(where: {
                    $0.id == self.userShape.id
                })
            }) {
                Image(systemName: "trash.fill")
                    .foregroundColor(.black)
            }
            .buttonStyle(.borderless)

            Button(action: {
                self.userShape.isShown.toggle()
            }) {
                if self.userShape.isShown {
                    Image(systemName: "eye.fill")
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(.gray)
                }
            }
            .buttonStyle(.borderless)
            
        }
    }
}


struct ObjectsViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsViewRow(userShape: ModelData().currentShapes[0])
    }
}
