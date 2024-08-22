//
//  View+CustomBGColor.swift
//  CocktailsApp
//
//  Created by Roman on 22/08/2024.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var customBackgroundColor: LinearGradient {
        .linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
