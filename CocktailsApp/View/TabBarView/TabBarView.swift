//
//  TabBarView.swift
//  CocktailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    @StateObject var controller = Controller()
    @ObservedObject var dataController: DataController
    
//    init() {
//
//        let appearance = UITabBarAppearance()
//        appearance.configureWithTransparentBackground()
//        appearance.backgroundColor = UIColor.clear
//        UITabBar.appearance().standardAppearance = appearance
//
//    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                CocktailsMainView(dataController: dataController)
                    .tag(0)
                
                RandomCocktailView(dataController: dataController)
                    .tag(1)
                
                SearchCocktailByName(dataController: dataController)
                    .tag(2)
                
                FavoriteCocktailView(dataController: dataController)
                    .tag(3)
                    
            }

        
            
            
            
            ZStack {
                HStack {
                    ForEach(TabbedItems.allCases, id: \.self) { item in
                        Button {
                            selectedIndex = item.rawValue
                        } label: {
                            customtabItem(imageName: item.iconName, title: item.title, isActive: (selectedIndex == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 80)
            .background(.indigo.opacity(0.6))
            .cornerRadius(40)
            .padding(.horizontal, 26)

        }

    }
        
}

extension TabBarView {
    func customtabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .white)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? 140 : 60, height: 60)
        .background(isActive ? .white.opacity(0.6) : .clear)
        .cornerRadius(30)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(dataController: DataController())
    }
}
