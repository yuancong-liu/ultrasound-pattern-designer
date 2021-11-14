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
            
            switch userShape.shapeCategory {
                case "rectangle":
                    List {
                        HStack {
                            Text("Name:")
                            TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                            $0.id == self.userShape.id
                        } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                            $0.id == self.userShape.id
                        } ) ?? 0].name)
                        }
                        
                        Text("Size").bold()
                        
                        
                        HStack {
                            Text("Width:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].width, formatter: NumberFormatter())
                            
                            Spacer()
                            
                            Text("Height:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].height, formatter: NumberFormatter())
                        }
                        
                        Text("Position").bold()
                        HStack {
                            Text("x:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].position.x, formatter: NumberFormatter())
                            
                            Spacer()
                            
                            Text("y:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].position.y, formatter: NumberFormatter())
                        }
                        
                        Text("Render").bold()
                        Picker("Direction:", selection: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                            $0.id == self.userShape.id
                        } ) ?? 0].direction) {
                            Image(systemName: "arrow.clockwise").tag(true)
                            Image(systemName: "arrow.counterclockwise").tag(false)
                        }
                        .pickerStyle(.segmented)
                        
                        HStack {
                            Text("Frequency:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].renderFreq, formatter: NumberFormatter())
                        }
                        
                    }
                    
                case "circle":
                    List {
                        HStack {
                            Text("Name:")
                            TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].name)
                        }
                        
                        Text("Size").bold()
                        
                        HStack {
                            Text("Radius:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].width, formatter: NumberFormatter())
                        }
                        
                        Text("Position").bold()
                        HStack {
                            Text("x:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].position.x, formatter: NumberFormatter())
                            
                            Spacer()
                            
                            Text("y:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].position.y, formatter: NumberFormatter())
                        }
                        
                        Text("Render").bold()
                        Picker("Direction:", selection: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                            $0.id == self.userShape.id
                        } ) ?? 0].direction) {
                            Image(systemName: "arrow.clockwise").tag(true)
                            Image(systemName: "arrow.counterclockwise").tag(false)
                        }
                        .pickerStyle(.segmented)
                        
                        HStack {
                            Text("Frequency:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].renderFreq, formatter: NumberFormatter())
                        }
                        
                    }
                    
                case "line":
                    List {
                        HStack {
                            Text("Name:")
                            TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].name)
                        }
                        
                        Text("Position").bold()
                        
                        Text("Point 1")
                        
                        HStack {
                            Text("x:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].startingPoint.x, formatter: NumberFormatter())
                        
                            Spacer()
                            
                            Text("y:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].startingPoint.y, formatter: NumberFormatter())
                        }
                        
                        Text("Point 2")
                        
                        HStack {
                            Text("x:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].endingPoint.x, formatter: NumberFormatter())
                        
                            Spacer()
                            
                            Text("y:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].endingPoint.y, formatter: NumberFormatter())
                        }
                        
                        Text("Render").bold()
                        
                        HStack {
                            Text("Frequency:")
                            TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].renderFreq, formatter: NumberFormatter())
                        }
                    }
                    
                default:
                    Text("Default")
            }
        }
    }
}

struct PropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesView(userShape: ModelData().currentShapes[0])
    }
}
