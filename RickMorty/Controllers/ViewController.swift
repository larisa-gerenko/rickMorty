//
//  ViewController.swift
//  RickMorty
//
//  Created by Larisa on 16.04.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    let reuseIdentifier = "reuseIdentifier"
    let toDetail = "toDetail"
    var characters: [Character] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NetworkService.shared.getCharacters(completion: setCharaters)
//        self.tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func setCharaters(arrayCharacters: [Character]) {
        characters = arrayCharacters
        tableView.reloadData()
    }


}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CharacterTableViewCell else {return UITableViewCell()}
        
        let character = self.characters[indexPath.row]
        
        cell.configure(character: character)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: toDetail, sender: characters[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toDetail {
            guard let destinationVC = segue.destination as? DetailViewController,
                  let selectedCharacter = sender as? Int
            else {return}
            
            destinationVC.characterID = selectedCharacter
        }
    }
    
   
}
