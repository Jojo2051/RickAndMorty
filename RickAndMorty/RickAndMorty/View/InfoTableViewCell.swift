//
//  InfoTableViewCell.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 18.08.23.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
