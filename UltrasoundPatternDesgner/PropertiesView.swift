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
                HStack {
                    Text("Wdith:")
                    Text(userShape.width.description)
                }
                HStack {
                    Text("Height:")
                    Text(userShape.height.description)
                }
                HStack {
                    Text("Rotation:")
                    Text(userShape.rotation.description)
                }
                HStack {
                    Text("ID:")
                    Text(userShape.id.description)
                }
            }
        }
    }
}

struct PropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesView(userShape: currentShapes[0])
    }
}
