//
//  ObjectsView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import SwiftUI

struct ObjectsView: View {
    
    @State var userShape: [UserShape] = currentShapes
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "puzzlepiece.extension.fill")
                    .imageScale(.large)
                Text("Objects")
                    .bold()
                    .font(.title2)
            }
            
            List(userShape) { shape in
                ObjectsViewRow(userShape: shape)
            }
        }
    }
}


struct ObjectsViewRow: View {
    
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
                    Image(systemName: "rectangle.fill")
                        .imageScale(.medium)
                default:
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
            }
            
            Text(userShape.name)
            Spacer()
            Toggle(isOn: $userShape.isShown) {
                Text("show!")
            }.toggleStyle(.switch)
        }
    }
}

struct ObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsView()
    }
}
