//
//  Character.swift
//  RickAndMortySearch
//
//  Created by Eduardo Geovanni Pérez Munguía on 04/05/26.
//

import Foundation

struct Character: Identifiable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let locationName: String
    let image: String
    let episodeURLs: [String]
    let latitude: Double
    let longitude: Double
}
