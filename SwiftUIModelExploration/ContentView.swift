//
//  ContentView.swift
//  SwiftUIModelExploration
//
//  Created by Jordan Gustafson on 6/30/20.
//

import SwiftUI

struct ContentView<NamedColorViewModel: NamedColorModel>: View {
    
    @EnvironmentObject var namedColorModel: NamedColorViewModel
    
    var body: some View {
        VStack {
            NamedColorView(model: namedColorModel)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentPreviewView()
    }
    
    struct ContentPreviewView: View {
        
        @StateObject var model: PreviewNamedColorModel = PreviewNamedColorModel(namedColor: nil)
        
        var body: some View {
            ContentView<PreviewNamedColorModel>()
                .environmentObject(model)
        }
        
    }
    
}
