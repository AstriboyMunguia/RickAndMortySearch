//
//  APIClient.swift
//  RickAndMortySearch
//
//  Created by Eduardo Geovanni Pérez Munguía on 04/05/26.
//

import Foundation

protocol ApiClientProtocol {
    func getCharacters(page: Int, name: String?, status: String?, species: String?) async throws -> [Character]
}

final class APIClient: ApiClientProtocol {
    func getCharacters(
        page: Int,
        name: String?,
        status: String?,
        species: String?
    ) async throws -> [Character] {
        var components = URLComponents(string: "https://rickandmortyapi.com/api/character")!
        
        var queryItems: [URLQueryItem] = [ URLQueryItem(name: "page", value: "\(page)")
        ]
        if let name, !name.isEmpty {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        if let status, !status.isEmpty {
            queryItems.append(URLQueryItem(name: "status", value: status))
        }
        if let species, !species.isEmpty {
            queryItems.append(URLQueryItem(name: "species", value: species))
        }
        
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        let decoded = try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
        return decoded.results.map { CharacterMapper.map($0)}
    }
}
