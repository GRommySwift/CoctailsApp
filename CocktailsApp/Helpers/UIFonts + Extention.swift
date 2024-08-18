//
//  Fonts.swift
//  CocktailsApp
//
//  Created by Roman on 18/08/2024.
//

import SwiftUI

enum PoppinsStyle: String {
    case black = "Poppins-Black"
    case blackItalic = "Poppins-BlackItalic"
    case bold = "Poppins-Bold"
    case boldItalic = "Poppins-BoldItalic"
    case extraBold = "Poppins-ExtraBold"
    case extraBoldItalic = "Poppins-ExtraBoldItalic"
    case extraLight = "Poppins-ExtraLight"
    case extraLightItalic = "Poppins-ExtraLightItalic"
    case italic = "Poppins-Italic"
    case light = "Poppins-Light"
    case lightItalic = "Poppins-LightItalic"
    case medium = "Poppins-Medium"
    case mediumItalic = "Poppins-MediumItalic"
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
    case semiBoldItalic = "Poppins-SemiBoldItalic"
    case thin = "Poppins-Thin"
    case thinItalic = "Poppins-ThinItalic"
}

enum FontStyles {
    case Headline1
    case Headline2
    case Body
    case Caption
}

extension Font {
    static func poppins(style: PoppinsStyle, size: CGFloat, isScaled: Bool = true) -> Font {
        Font.custom(style.rawValue, size: size)
    }
}

extension Font {
    static func custom(_ fontType: FontStyles) -> Font {
        switch fontType {
        case .Headline1:
            return poppins(style: .medium, size: 40)     // .font(.custom(.Headline1))
        case .Headline2:
            return poppins(style: .regular, size: 30)
        case .Body:
            return poppins(style: .medium, size: 18)
        case .Caption:
            return poppins(style: .regular, size: 16)
        }
    }
}

extension View {
    func font(_ style: FontStyles) -> some View {        // .font(.Headline1)
        self.font(Font.custom(style))
    }
}
