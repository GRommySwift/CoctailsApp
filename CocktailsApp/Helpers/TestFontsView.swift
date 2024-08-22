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
            Text("This is headline1")
                .font(.headline1)
            Text("This is headline2")
                .font(.headline2)
            Text("This is body")
                .font(.body)
            Text("This is caption ")
                .font(.caption)
        }
    }
}

struct TestFontsView_Previews: PreviewProvider {
    static var previews: some View {
        TestFontsView()
    }
}
