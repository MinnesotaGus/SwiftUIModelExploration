//
//  NamedColorView.swift
//  SwiftUIModelExploration
//
//  Created by Jordan Gustafson on 6/30/20.
//

import SwiftUI

struct NamedColorView<Model: NamedColorModel>: View {
    
    @ObservedObject var model: Model
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Name", text: $model.name)
                .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            ColorPicker(selection: $model.color, label: {
                EmptyView()
            })
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .onDisappear {
            model.save()
        }
    }
    
}

struct ColorView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            Group {
                ColorTestView()
                    .previewDevice("iPhone 11")
            }
            
            Group {
                ColorTestView()
                    .previewDevice("iPhone 11")
            }.preferredColorScheme(.dark)
        }
    }
    
    
    private struct ColorTestView: View {
        
        @StateObject var namedColorModel: PreviewNamedColorModel = PreviewNamedColorModel(namedColor: nil)
        
        var body: some View {
            NamedColorView(model: namedColorModel)
        }
        
    }
    
}


final class PreviewNamedColorModel: NamedColorModel {
    
    @Published var name: String
    
    @Published var color: Color
    
    private let namedColor: NamedColor?
    
    init(namedColor: NamedColor?) {
        self.namedColor = namedColor
        self.name = namedColor?.name ?? "Name"
        self.color = namedColor?.color ?? Color.orange
    }
    
    func save() {
        //Persist to disk
    }
    
}

