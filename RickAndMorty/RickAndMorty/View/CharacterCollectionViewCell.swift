//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 17.08.23.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImage: UIImageView!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 10.0
    }
}
