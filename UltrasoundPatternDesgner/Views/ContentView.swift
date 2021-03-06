//
//  ContentView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var showExportAlert: Bool = false
    @State var exportable: Bool = false
    
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
                
                Divider()
                
                Button(action: {}) {
                    Image(systemName: "rectangle.on.rectangle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                
                Divider()
                        
                Button(action: { clearCanvas(modelData) }) {
                    Image(systemName: "trash.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button(action: { checkProblematic(modelData) }) {
                    Image(systemName: "app.badge.checkmark")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    checkProblematic(modelData)
                    if modelData.problematicObjects.isEmpty {
                        self.exportable = true
                        exportShapes(modelData.currentShapes)
                    } else {
                        self.exportable = false
                    }
                    self.showExportAlert = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                .alert(isPresented: $showExportAlert) {
                    let title = exportable ? Text("Exported!") : Text("Error!")
                    let message = exportable ? Text("\(modelData.currentShapes.count) shapes in total!\n") : Text("Something wrong with your shapes!")
                    
                    return Alert(title: title,
                              message: message,
                              dismissButton: .default(Text("OK!")))
                }
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            .frame(height: 30)
            
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
                    .frame(height: 435)
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
