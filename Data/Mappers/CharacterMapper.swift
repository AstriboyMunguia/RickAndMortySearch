//
//  CharacterMapper.swift
//  RickAndMortySearch
//
//  Created by Eduardo Geovanni Pérez Munguía on 04/05/26.
//

import Foundation

enum CharacterMapper {
    static func map(_ dto: CharacterDTO) -> Character {
        Character(
            id: dto.id,
            name: dto.name,
            status: dto.status,
            species: dto.species,
            gender: dto.gender,
            locationName: dto.location.name,
            image: dto.image,
            episodeURLs: dto.episode,
            latitude: Double.random(in: 19.0...19.8),
            longitude: Double.random(in: -99.5 ... -98.8)
        )
    }
}

