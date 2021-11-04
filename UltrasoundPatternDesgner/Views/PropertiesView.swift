//
//  PropertiesView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import SwiftUI

struct PropertiesView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var userShape: UserShape
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "dial.min.fill")
                    .imageScale(.large)
                Text("Properties")
                    .bold()
                    .font(.title2)
            }
            
            List {
                HStack {
                    Text("Name:")
                    TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].name)
                }
                
                Stepper(value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].width, in: 1...1000) {
                    Text("Width:")
                    Text(modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                        $0.id == self.userShape.id
                    } ) ?? 0].width.description)
                }
                
                Stepper(value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].height, in: 1...500) {
                    Text("Height:")
                    Text(modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                        $0.id == self.userShape.id
                    } ) ?? 0].height.description)
                }
                Stepper(value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].rotation, in: -360...360) {
                    Text("Rotation:")
                    Text(modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                        $0.id == self.userShape.id
                    } ) ?? 0].rotation.description)
                }
                Stepper(value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].centroid.x, in: 1...1000) {
                    Text("x:")
                    Text(modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                        $0.id == self.userShape.id
                    } ) ?? 0].centroid.x.description)
                }
                Stepper(value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                    $0.id == self.userShape.id
                } ) ?? 0].centroid.y, in: 1...500) {
                    Text("y:")
                    Text(modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                        $0.id == self.userShape.id
                    } ) ?? 0].centroid.y.description)
                }
            }
        }
    }
}

struct PropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesView(userShape: ModelData().currentShapes[0])
    }
}
