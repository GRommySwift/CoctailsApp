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
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    ForEach(controller.randomCoctail, id: \.idDrink) { coctail in
                        CoctailAsyncImage(coctail: coctail)
                        
                        VStack(spacing: 10) {
                            Text("Category - \(coctail.strCategory)" + " " + "(\(coctail.strAlcoholic))")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.orange.opacity(0.8))
                            
                            Text("Instruction:")
                                .foregroundColor(Color.cyan)
                            Text(coctail.strInstructions)
                                .foregroundColor(Color.cyan)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            
                            Text("Ingridients")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            RandomCoctailIgridients()
                        }
                        .shadow(radius: 1)
                    }
                }
            }
            
            .background(.blue.opacity(0.2))
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


