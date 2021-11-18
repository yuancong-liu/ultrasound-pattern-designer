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
                Image(systemName: "cube.fill")
                    .imageScale(.large)
                Text("Objects")
                    .bold()
                    .font(.title2)
            }
            .padding(.leading, 10)
            NavigationView{
                List(modelData.currentShapes) { shape in
                    NavigationLink {
                        PropertiesView(userShape: shape)
                    } label: {
                        ObjectsViewRow(userShape: shape)
                    }
                    
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
            .frame(minWidth: 300)
        }
    }
}


struct ObjectsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ObjectsView().environmentObject(ModelData())
    }
}
