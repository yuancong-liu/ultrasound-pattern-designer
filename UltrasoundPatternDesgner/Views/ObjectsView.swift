//
//  ObjectsView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/31.
//

import SwiftUI

struct ObjectsView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "puzzlepiece.extension.fill")
                    .imageScale(.large)
                Text("Objects")
                    .bold()
                    .font(.title2)
            }
            List(modelData.currentShapes) { shape in
                ObjectsViewRow(userShape: shape)
            }
        }
    }
}


struct ObjectsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ObjectsView().environmentObject(ModelData())
    }
}
