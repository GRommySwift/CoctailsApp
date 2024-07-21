//
//  NetworkError.swift
//  CoctailsApp
//
//  Created by Roman on 19/07/2024.
//

import SwiftUI

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Inavalid response from a server"
    case invalidData = "The data received from the server invalid"
}

