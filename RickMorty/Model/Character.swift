//
//  Character.swift
//  RickMorty
//
//  Created by Larisa on 17.04.2022.
//

import Foundation

struct Character: Decodable {
    var id: Int
    var name: String
    var image: String
    var species: String
    var gender: String
    var status: String
    var location: Location
    var episode: [String]
}

struct CharacterList: Decodable {
    var results: [Character]
}
