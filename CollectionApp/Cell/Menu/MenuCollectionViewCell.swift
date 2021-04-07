//
//  MenuCollectionViewCell.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/04/03.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    var isFavorite: Bool = false
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var setNameLabelText: String = "" {
        didSet {
            characterNameLabel.text = setNameLabelText
        }
    }
    
    var setCharacterImage: String = "" {
        didSet {
            characterImageView.image = UIImage(named: setCharacterImage)
        }
    }
    
    
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        isFavorite.toggle()
        if isFavorite == true {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
