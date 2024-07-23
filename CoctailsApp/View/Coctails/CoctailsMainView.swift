//
//  CoctailsMainView.swift
//  CoctailsApp
//
//  Created by Roman on 21/07/2024.
//

import SwiftUI

struct CoctailsMainView: View {
    @StateObject var controller = Controller()
   // let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
             //   LazyVGrid(columns: columns) {
                    //VStack {
                            //if controller.isLoading == true {
                            //    ProgressView()
                           // } else {
                                ForEach(controller.tenRandomCoctails, id: \.idDrink) { coctail in
                                    NavigationLink(destination: DetailView(widthOfImage: UIScreen.main.bounds.width, coctail: coctail)) {
                                        HStack {
                                            
                                            VStack {
                                                CoctailAsyncImage(widthOfImage: UIScreen.main.bounds.width / 2.5, withText: false, coctail: coctail)
                                            }
                                            .background(.blue.opacity(0.5))

                                            VStack {
                                                Text(coctail.strDrink)
                                            }
                                            .frame(width: UIScreen.main.bounds.width / 2)
                                            .background(.red.opacity(0.5))
                                        }
                                        .background(.green.opacity(0.5))
                                        
                                    }
                          //  }
                            
                        //}
                    }
                                .background(.clear)
               // }
          //      .padding(.bottom, 100)
                .padding(.horizontal, 20)
            }
            .background(.blue.opacity(0.2))
        }

        
    }
    
}

struct CoctailsMainView_Previews: PreviewProvider {
    static var previews: some View {
        CoctailsMainView()
    }
}
