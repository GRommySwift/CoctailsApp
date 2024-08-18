//
//  TestFontsView.swift
//  CocktailsApp
//
//  Created by Roman on 18/08/2024.
//

import SwiftUI

struct TestFontsView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            Text("Head Line 1")
                .font(.Headline1)
               
            Text("Head Line 1")
                .font(.Headline2)
            Text("Head Line 1")
                .font(.Body)
            Text("Head Line 1")
                .font(.Caption)
        }
    }
}

struct TestFontsView_Previews: PreviewProvider {
    static var previews: some View {
        TestFontsView()
    }
}
