//
//  SearchCoctailByName.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct SearchCoctailByName: View {
    @StateObject var controller = Controller()
    @State private var inputText: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                SearchView(isSerchByNameOfCoctail: true, searchByName: controller.searchCoctailByName(coctailName: inputText), defaultText: "Type the name of coctail", searchText: $inputText )
                    ForEach(controller.serchedCoctailsByName) { coctail in
                        HStack {
                            NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 20, buttonIsHidden: false, coctail: coctail)) {
                                BigElementDrink(coctail: coctail)
                            }
                        }
                    }
            }
        }
    }
}

struct SearchCoctailByName_Previews: PreviewProvider {
    static var previews: some View {
        SearchCoctailByName()
    }
}


