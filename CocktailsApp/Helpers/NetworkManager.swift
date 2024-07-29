//
//  NetworkManager.swift
//  CocktailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func getCocktail(url: String) async throws -> CocktailsModel {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        do {
            return try decoder.decode(CocktailsModel.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
