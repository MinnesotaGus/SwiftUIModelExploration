//
//  NamedColorModel.swift
//  SwiftUIModelExploration
//
//  Created by Jordan Gustafson on 6/30/20.
//

import SwiftUI

protocol NamedColorModel: ObservableObject {

    var name: String { get set }
    
    var color: Color { get set }
    
    func save()
    
}

final class AppNamedColorModel: NamedColorModel {
    
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

