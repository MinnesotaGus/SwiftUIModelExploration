//
//  SwiftUIModelExplorationApp.swift
//  SwiftUIModelExploration
//
//  Created by Jordan Gustafson on 6/30/20.
//

import SwiftUI

@main
struct SwiftUIModelExplorationApp: App {
    
    @StateObject var namedColorModel: AppNamedColorModel = AppNamedColorModel(namedColor: nil)
    
    var body: some Scene {
        WindowGroup {
            MainView<AppNamedColorModel>()
                .environmentObject(namedColorModel)
        }
    }
    
}

