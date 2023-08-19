//
//  CharactersCollectionViewController.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 17.08.23.
//

import UIKit

private let reuseIdentifier = "CharacterCardCell"

class CharactersCollectionViewController: UICollectionViewController {
    var characters = Array(repeating: CharacterModel(id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", originName: "", originURL: "", episodes: []), count: 30)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        for item in 1...characters.count {
            CharacterManager.shared.getCharacter(id: item) { [weak self] character in
                DispatchQueue.main.async {
                    guard let self else { return }
                    self.characters[item-1] = character
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        cell.characterName.text = characters[indexPath.row].name
        cell.characterImage.image = UIImage(named: "\(characters[indexPath.row].id)")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            if let indexPath = collectionView.indexPathsForSelectedItems {
                let destinationController = segue.destination as! DetailViewController
                destinationController.speciesText = self.characters[indexPath[0].row].species
                destinationController.genderText = self.characters[indexPath[0].row].gender
                destinationController.typeText = self.characters[indexPath[0].row].type
                destinationController.statusText = self.characters[indexPath[0].row].status
                destinationController.nameText = self.characters[indexPath[0].row].name
                destinationController.imageText = "\(self.characters[indexPath[0].row].id)"
                destinationController.originNameText = self.characters[indexPath[0].row].originName
                destinationController.originURL = self.characters[indexPath[0].row].originURL
                destinationController.episodes = self.characters[indexPath[0].row].episodes
            }
        }

    }
}
