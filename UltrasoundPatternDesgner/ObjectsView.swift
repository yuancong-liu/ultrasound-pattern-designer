//
//  ObjectsView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import SwiftUI

struct ObjectsView: View {
    
//    var sampleObjects = [Object]()
//    sampleObjects.append()
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "puzzlepiece.extension.fill")
                    .imageScale(.large)
                Text("Objects")
                    .bold()
                    .font(.title2)
            }
            
            List {
                ObjectsViewRow()
                
            }
        }
    }
}

struct ObjectsViewRow: View {
    
    @State var userShape: UserShape = UserShape(CGPoint(x: 30, y: 60), CGPoint(x: 40, y: 100))
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .imageScale(.medium)
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
