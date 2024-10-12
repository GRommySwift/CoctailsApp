//
//  View+CustomBGColor.swift
//  CocktailsApp
//
//  Created by Roman on 22/08/2024.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: alpha
            )
        }
}

extension ShapeStyle where Self == Color {
    static var tabBackgroundColor: Color {
        Color.init(hex: 0xd8e5f7)
    }
    static var foregroundColor: Color {
        Color.init(hex: 0xd8eedf)
    }
    
    static var customBackgroundColor: LinearGradient {
        .linearGradient(Gradient(colors: [Color.init(hex: 0xd8e5f7), Color.init(hex: 0xd8eedf)]), startPoint: .leading, endPoint: .trailing)
    }
}


