//
//  Fonts.swift
//  CocktailsApp
//
//  Created by Roman on 18/08/2024.
//

import SwiftUI

extension View {
    func font(_ style: FontStyle) -> some View {
        self.font(Font.custom(style))
    }
}

extension Font {
    fileprivate static func custom(_ fontType: FontStyle) -> Font {
        switch fontType {
        case .headline1:
            return poppins(style: .medium, size: 40)
        case .headline2:
            return poppins(style: .regular, size: 30)
        case .body:
            return poppins(style: .medium, size: 18)
        case .caption:
            return poppins(style: .regular, size: 16)
        }
    }
    
    private static func poppins(style: PoppinsStyle, size: CGFloat, isScaled: Bool = true) -> Font {
        Font.custom(style.rawValue, size: size)
    }
}
