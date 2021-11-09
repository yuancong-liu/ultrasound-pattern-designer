//
//  UltrasoundPatternDesgnerApp.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

@main
struct UltrasoundPatternDesgnerApp: App {
    
    @State private var modelData = ModelData()
    
    @State var canvasWidth: Int = 1000
    @State var canvasHeight: Int = 500
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .frame(minWidth: 1000, idealWidth: 1000, maxWidth: 1400, minHeight: 800, idealHeight: 800, maxHeight: 1000)
        }
    }
}

