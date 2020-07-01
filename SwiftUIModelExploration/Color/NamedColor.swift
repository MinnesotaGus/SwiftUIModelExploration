//
//  NamedColor.swift
//  SwiftUIModelExploration
//
//  Created by Jordan Gustafson on 6/30/20.
//

import Foundation
import SwiftUI

struct NamedColor {
    
    let id: String
    let name: String
    let color: Color
    
    init(name: String, color: Color) {
        self.id = UUID().uuidString
        self.name = name
        self.color = color
    }
    
}


//MARK: - Codable

extension NamedColor: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(CodableColor(color: color), forKey: .color)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.color = (try container.decode(CodableColor.self, forKey: .color)).color
    }
        
}

fileprivate struct CodableColor: Codable {
    
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
    
    var color: Color {
        let uiColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return Color(uiColor)
    }
    
    init(color: Color) {
        let uiColor = UIColor(color)
        self.red = uiColor.redValue
        self.green = uiColor.greenValue
        self.blue = uiColor.blueValue
        self.alpha = uiColor.alphaValue
    }
    
}

fileprivate extension UIColor {
    
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
    
}

