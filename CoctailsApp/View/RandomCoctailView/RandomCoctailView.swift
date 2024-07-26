//
//  ContentView.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

struct RandomCoctailView: View {
    
    @StateObject var controller = Controller()
    
    var body: some View {
        NavigationView {
//ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 10) {
                    ForEach(controller.randomCoctail, id: \.idDrink) { coctail in
                        DetailView(widthOfImage: UIScreen.main.bounds.width, topPadding: 0, buttonIsHidden: true, coctail: coctail)
                        
                        .shadow(radius: 1)
                    }
                }
            //}
            
                
            .refreshable {
                controller.fetchRandomCoctail()
            }
            
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            RandomCoctailView()
        }
    }
    
}
