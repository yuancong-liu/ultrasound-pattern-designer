//
//  ContentView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    modelData.currentShapes.append(UserShape(CGPoint(x: Int.random(in: 0...400), y: Int.random(in: 0...400)), CGPoint(x: Int.random(in: 0...400), y: Int.random(in: 0...400)), "circle"))
                }) {
                    Image(systemName: "circle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    modelData.currentShapes.append(UserShape(CGPoint(x: Int.random(in: 0...400), y: Int.random(in: 0...400)), CGPoint(x: Int.random(in: 0...400), y: Int.random(in: 0...400)), "rectangle"))
                }) {
                    Image(systemName: "square")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    modelData.currentShapes.append(UserShape(CGPoint(x: Int.random(in: 0...400), y: Int.random(in: 0...400)), CGPoint(x: Int.random(in: 0...400), y: Int.random(in: 0...400)), "line"))
                }) {
                    Image(systemName: "scribble")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "rectangle.on.rectangle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            Divider()
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    
                    HStack {
                        Image(systemName: "paintbrush.fill")
                            .imageScale(.large)
                        Text("Canvas")
                            .bold()
                            .font(.title2)
                    }
                    .padding(.leading, 10)
                    
                    UserCanvas()
                        .background(Color.white)
                        .frame(width: 400, height: 400)
                }
                
                
                Divider()
                ObjectsView()
//                    .frame(height: 200)
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
