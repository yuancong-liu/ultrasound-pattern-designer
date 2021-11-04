//
//  ContentView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var showPatterns = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    modelData.currentShapes.append(UserShape(CGPoint(x: Int.random(in: 20...1000), y: Int.random(in: 20...500)), CGPoint(x: Int.random(in: 20...1000), y: Int.random(in: 20...500)), "circle"))
                }) {
                    Image(systemName: "circle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    modelData.currentShapes.append(UserShape(CGPoint(x: Int.random(in: 20...1000), y: Int.random(in: 20...500)), CGPoint(x: Int.random(in: 20...1000), y: Int.random(in: 20...500)), "rectangle"))
                }) {
                    Image(systemName: "square")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    modelData.currentShapes.append(UserShape(CGPoint(x: Int.random(in: 20...1000), y: Int.random(in: 20...500)), CGPoint(x: Int.random(in: 20...1000), y: Int.random(in: 20...500)), "triangle"))
                }) {
                    Image(systemName: "triangle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Toggle(isOn: $showPatterns) {
                    Text("Alignments")
                        .bold()
                }.toggleStyle(.switch)
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            Divider()
            
            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    
                    HStack {
                        Image(systemName: "paintbrush.fill")
                            .imageScale(.large)
                        Text("Canvas")
                            .bold()
                            .font(.title2)
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    UserCanvas()
                }
                
                
                Spacer()
                Divider()
                ObjectsView()
                    .frame(height: 200)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(ModelData())
        }
    }
}
