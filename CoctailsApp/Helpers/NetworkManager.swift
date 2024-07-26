//
//  NetworkManager.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    func getCoctails(url: String) async throws -> CoctailModel {
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        do {
            return try decoder.decode(CoctailModel.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
