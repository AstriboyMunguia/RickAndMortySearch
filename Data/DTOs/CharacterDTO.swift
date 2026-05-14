//
//  CharacterDTO.swift
//  RickAndMortySearch
//
//  Created by Eduardo Geovanni Pérez Munguía on 04/05/26.
//

import Foundation

struct CharacterResponseDTO: Decodable {
    let info: PageInfoDTO
    let result: [CharacterDTO]
}

struct PageInfoDTO: Decodable {
    let next: String?
}

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let location: LocationDTO
    let episode: [String]
}

struct LocationDTO: Decodable {
    let name: String
}
