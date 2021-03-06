//
//  NetworkService.swift
//  RickMorty
//
//  Created by Larisa on 18.04.2022.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    private init(){}
    
    func getCharacters(completion: @escaping ([Character]) -> ()) {
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: CharacterList.self) { (response) in
            guard let characterList = response.value else {
                print("erroe")
                return
                
            }
            
            completion(characterList.results)
           
        }
    }
    
    func getCharacter(id: Int, completion: @escaping (Character) -> ()) {
        
        AF.request("https://rickandmortyapi.com/api/character/\(id)").responseDecodable(of: Character.self) { (response) in
            guard let character = response.value else {
                print("error")
                return
                
            }
            completion(character)
        }
        
    }
}


