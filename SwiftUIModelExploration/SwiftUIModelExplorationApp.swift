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
            ContentView<AppNamedColorModel>()
                .environmentObject(namedColorModel)
        }
    }
    
}

struct SwiftUIModelExplorationApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
