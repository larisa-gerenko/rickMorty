//
//  DetailViewController.swift
//  RickMorty
//
//  Created by Larisa on 18.04.2022.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterSpecies: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterLocation: UILabel!
    @IBOutlet weak var characterEpisode: UILabel!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    var characterID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.getCharacter(id: characterID!) { detail in
            self.fillDetail(character: detail)
        }
       
    }
    
    func fillDetail(character: Character) {
        
        characterLocation.lineBreakMode = .byWordWrapping
        characterLocation.numberOfLines = 0
        
        navigationTitle.title = character.name
        characterSpecies.text = character.species
        characterGender.text = character.gender
        characterStatus.text = character.status
        characterImage.image = UIImage(data: try! Data(contentsOf: URL(string: character.image)!))
        characterLocation.text = character.location.name
        characterEpisode.text = "Amount of episodes: \(character.episode.count)"
    }
    
}
