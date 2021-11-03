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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .frame(minWidth: 1000, idealWidth: 1000, maxWidth: 1400, minHeight: 600, idealHeight: 600, maxHeight: 1000)
        }
    }
}

