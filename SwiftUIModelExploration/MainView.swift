//
//  MainView.swift
//  SwiftUIModelExploration
//
//  Created by Jordan Gustafson on 6/30/20.
//

import SwiftUI

struct MainView<NamedColorViewModel: NamedColorModel>: View {
    
    @EnvironmentObject var namedColorModel: NamedColorViewModel
    
    var body: some View {
        VStack {
            NamedColorView(model: namedColorModel)
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        
        @StateObject var model = ColorView_Previews.PreviewNamedColorModel(namedColor: nil)
        
        var body: some View {
            MainView<ColorView_Previews.PreviewNamedColorModel>()
                .environmentObject(model)
        }
        
    }
    
}
