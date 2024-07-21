//
//  CoctailAsyncImagge.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

struct CoctailAsyncImage: View {
    let coctail: Drink
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.clear).edgesIgnoringSafeArea(.all)
            if let url = coctail.strDrinkThumb, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(33)
                            .padding()
                            .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            Text(coctail.strDrink)
                .frame(width: UIScreen.main.bounds.width - 32, height: 60)
                .background(Color.white)
                .cornerRadius(30, corners: .bottomLeft)
                .cornerRadius(30, corners: .bottomRight)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.cyan).opacity(0.9)
                .padding(.bottom, 15)
            
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomCoctailView()
//    }
//}
