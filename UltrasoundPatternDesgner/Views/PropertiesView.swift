//
//  PropertiesView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import SwiftUI

struct PropertiesView: View {
    
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
                    TextField("\(userShape.name)", text: $userShape.name)
                }
                
                Stepper(value: $userShape.width, in: 1...100) {
                    Text("Width:")
                    Text(userShape.width.description)
                }
                
                Stepper(value: $userShape.height, in: 1...100) {
                    Text("Height:")
                    Text(userShape.height.description)
                }
                Stepper(value: $userShape.rotation, in: 1...100) {
                    Text("Rotation:")
                    Text(userShape.rotation.description)
                }
                Stepper(value: $userShape.centroid.x, in: 1...100) {
                    Text("x:")
                    Text(userShape.centroid.x.description)
                }
                Stepper(value: $userShape.centroid.y, in: 1...100) {
                    Text("y:")
                    Text(userShape.centroid.y.description)
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
