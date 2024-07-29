//
//  SearchView.swift
//  CocktailsApp
//
//  Created by Roman on 26/07/2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    let clearSearchedCocktails: @MainActor () -> ()
    let defaultText: String
    let searchFunction: @MainActor (String) -> ()
    
    var body: some View {
        HStack {
            TextField(defaultText, text: $searchText)
                .foregroundColor(.black.opacity(0.7))
                .padding(.leading, 50)
                .overlay(
                    Image(systemName: "xmark.circle")
                        .frame(width: 50, height: 42)
                        .background(
                            Rectangle()
                                .foregroundColor(.red.opacity(0.9))
                                .frame(width: 40, height: 42)
                                .cornerRadius(20, corners: .bottomRight)
                                .cornerRadius(20, corners: .topRight)
                        )
                        .offset(x: 0)
                        .padding(.trailing, -20)
                        .foregroundColor(.black.opacity(0.6))
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            clearSearchedCocktails()
                        }
                    , alignment: .trailing
                )
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .frame(width: 50, height: 42)
                        .background(.blue.opacity(0.5))
                        .foregroundColor(.black)
                        .cornerRadius(20, corners: .bottomLeft)
                        .cornerRadius(20, corners: .topLeft)
                        .padding()
                        .offset(x: -26)
                        .onTapGesture {
                            searchFunction(searchText)
                        }
                    , alignment: .leading
                )
        }
        .font(.headline)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.secondary.opacity(0.1))
                .shadow(
                    color: .black, radius: 10, x: 0, y: 0))
        
        .padding(.horizontal, 20)
        
    }
    
}
