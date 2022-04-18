//
//  CharacterTableViewCell.swift
//  RickMorty
//
//  Created by Larisa on 17.04.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var speciesName: UILabel!
    @IBOutlet weak var genderName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(character: Character) {
        
        characterName.text = character.name
        speciesName.text = character.species
        genderName.text = character.gender
        
        
        characterImage.image = UIImage(data: try! Data(contentsOf: URL(string: character.image)!))
        
    }

}
