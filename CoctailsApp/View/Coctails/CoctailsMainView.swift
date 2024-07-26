//
//  CoctailsMainView.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct CoctailsMainView: View {
    @StateObject var controller = Controller()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(controller.tenRandomCoctails, id: \.idDrink) { coctail in
                    NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 20, buttonIsHidden: false, coctail: coctail)) {
                        BigElementDrink(coctail: coctail)
                    }
                }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}


struct CoctailsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CoctailsMainView()
    }
}

