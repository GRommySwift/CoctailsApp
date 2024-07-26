//
//  DetailView.swift
//  CoctailsApp
//
//  Created by Roman on 23/07/2024.
//

import SwiftUI

// Detail information about coctail, used on all screens

struct DetailView: View {
    let widthOfImage: CGFloat
    let topPadding: CGFloat
    let buttonIsHidden: Bool
    let coctail: Drink
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                CoctailAsyncImage(widthOfImage: widthOfImage, withText: true, coctail: coctail)
                DescriptionCoctail(coctail: coctail)
                Spacer()
                RandomCoctailIgridients()
            }
            .padding(.top, topPadding)
           // .ignoresSafeArea()
            .toolbar(.hidden, for: .navigationBar)
            .background(.linearGradient(Gradient(colors: [.mint.opacity(0.8), .indigo.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            if !buttonIsHidden {
                BackButtonView()
                    .padding(.leading, 20)
            }
            
        }
    }
}
