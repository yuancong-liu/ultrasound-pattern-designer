//
//  ContentView.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var showPatterns = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "circle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "square")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "triangle")
                        .imageScale(.medium)
                        .foregroundColor(.blue)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "star")
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
                    
                    Spacer()
                    
                    UserCanvas()
                }
                
                
                Spacer()
                Divider()
                VStack (alignment: .leading) {
                    
                    ObjectsView()
                    PropertiesView()
                    
                }
                .padding(.horizontal, 5)
                .frame(maxWidth: 200)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
            ContentView()
        }
    }
}
