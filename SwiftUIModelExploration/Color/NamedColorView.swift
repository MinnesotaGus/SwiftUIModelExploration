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
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 2) {
                    if !model.name.isEmpty {
                        Text("Color Name")
                            .font(.caption)
                    }
                    TextField("Color Name", text: $model.name.animation())
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color(UIColor.label)))
                }
                ColorPicker(selection: $model.color, label: {
                    EmptyView()
                })
                Spacer()
            }
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
    
    //MARK: - Preview Model
    
    final class PreviewNamedColorModel: NamedColorModel {
        
        @Published var name: String
        
        @Published var color: Color
        
        private let namedColor: NamedColor?
        
        init(namedColor: NamedColor?) {
            self.namedColor = namedColor
            self.name = namedColor?.name ?? ""
            self.color = namedColor?.color ?? Color.orange
        }
        
        func save() {
            //Persist to disk
        }
        
    }
    
}

