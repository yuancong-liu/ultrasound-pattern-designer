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
            if modelData.currentShapes.count != 0 {
                switch userShape.shapeCategory {
                    // Rectangle
                    case "rectangle":
                        List {
                            // Name
                            HStack {
                                Text("Name:")
                                TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].name)
                            }
                            
                            
                            // Size
                            Text("Size").bold()
                            
                            HStack {
                                // Width
                                Text("Width:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].width, formatter: NumberFormatter())
                                    .foregroundColor(10 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].width && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].width <= 100 ? .black : .pink)
                                
                                Spacer()
                                
                                // Height
                                Text("Height:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].height, formatter: NumberFormatter())
                                    .foregroundColor(10 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].height && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].height <= 100 ? .black : .pink)
                            }
                            
                            // Position
                            Text("Position").bold()
                            HStack {
                                
                                // x
                                Text("x:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].position.x, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.x && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.x <= 400 ? .black : .pink)
                                
                                Spacer()
                                
                                // y
                                Text("y:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].position.y, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.y && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.y <= 400 ? .black : .pink)
                            }
                            
                            // Render
                            Text("Render").bold()
                            
                            // Direction
                            Picker("Direction:", selection: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].direction) {
                                Image(systemName: "arrow.clockwise").tag(true)
                                Image(systemName: "arrow.counterclockwise").tag(false)
                            }
                            .pickerStyle(.segmented)
                            
                            // Frequency
                            HStack {
                                Text("Frequency:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].renderFreq, formatter: NumberFormatter())
                            }
                            
                            
                        }
                        
                    
                    // Circle
                    case "circle":
                        List {
                            
                            // Name
                            HStack {
                                Text("Name:")
                                TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].name)
                            }
                            
                            //Size
                            Text("Size").bold()
                            
                            HStack {
                                // Radius
                                Text("Radius:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].width, formatter: NumberFormatter())
                                    .foregroundColor(10 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].width && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].width <= 100 ? .black : .pink)
                            }
                            
                            // Position
                            Text("Position").bold()
                            HStack {
                                
                                // x
                                Text("x:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].position.x, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.x && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.x <= 400 ? .black : .pink)
                                
                                Spacer()
                                
                                // y
                                Text("y:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].position.y, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.y && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].position.y <= 400 ? .black : .pink)
                            }
                            
                            // Render
                            Text("Render").bold()
                            
                            // Direction
                            Picker("Direction:", selection: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                $0.id == self.userShape.id
                            } ) ?? 0].direction) {
                                Image(systemName: "arrow.clockwise").tag(true)
                                Image(systemName: "arrow.counterclockwise").tag(false)
                            }
                            .pickerStyle(.segmented)
                            
                            // Frequency
                            HStack {
                                Text("Frequency:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].renderFreq, formatter: NumberFormatter())
                            }
                            
                        }
                        
                    case "line":
                        List {
                            
                            // Name
                            HStack {
                                Text("Name:")
                                TextField((modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].name), text: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].name)
                            }
                            
                            // Position
                            Text("Position").bold()
                            
                            // Point 1
                            Text("Point 1")
                            
                            HStack {
                                
                                // x
                                Text("x:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].startingPoint.x, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].startingPoint.x && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].startingPoint.x <= 400 ? .black : .pink)
                            
                                Spacer()
                                
                                // y
                                Text("y:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].startingPoint.y, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].startingPoint.y && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].startingPoint.y <= 400 ? .black : .pink)
                            }
                            
                            // Point 2
                            Text("Point 2")
                            
                            HStack {
                                
                                // x
                                Text("x:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].endingPoint.x, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].endingPoint.x && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].endingPoint.x <= 400 ? .black : .pink)
                            
                                Spacer()
                                
                                // y
                                Text("y:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].endingPoint.y, formatter: NumberFormatter())
                                    .foregroundColor(0 <= modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].endingPoint.y && modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                        $0.id == self.userShape.id
                                    } ) ?? 0].endingPoint.y <= 400 ? .black : .pink)
                            }
                            
                            // Render
                            Text("Render").bold()
                            
                            HStack {
                                
                                // Frequency
                                Text("Frequency:")
                                TextField("number", value: $modelData.currentShapes[modelData.currentShapes.firstIndex(where: {
                                    $0.id == self.userShape.id
                                } ) ?? 0].renderFreq, formatter: NumberFormatter())
                            }
                        }
                        
                    default:
                        Text("Default")
                }
            } else {
                Text("No objects!")
            }
            
        }
    }
}

struct PropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesView(userShape: ModelData().currentShapes[0])
    }
}
