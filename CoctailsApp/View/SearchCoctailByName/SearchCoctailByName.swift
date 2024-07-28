//
//  SearchCoctailByName.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct SearchCoctailByName: View {
    @StateObject var controller = Controller()
    @State var inputText: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                SearchView(searchText: $inputText, searchFunction: controller.searchCoctailByName, clearSearchedCoctails: controller.clearSearchedCoctails, defaultText: "Type the name of coctail")
                ForEach(controller.serchedCoctailsByName, id: \.idDrink) { coctail in
                        HStack {
                            NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 25, buttonIsHidden: false, coctail: coctail, isFavorite: { controller.isFavorite(coctail: coctail) } , addFavorite: { controller.addFavorite(coctail: coctail) }, removeFavorite: {  controller.removeFavorite(coctail: coctail) })) {
                                BigElementDrink(coctail: coctail)
                            }
                        }
                    }
            }
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        
        }
    }
    
}

struct SearchCoctailByName_Previews: PreviewProvider {
    static var previews: some View {
        SearchCoctailByName()
    }
}


