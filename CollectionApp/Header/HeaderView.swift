//
//  HeaderView.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/04/03.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.layer.cornerRadius = 20
        titleLabel.clipsToBounds = true
        titleLabel.layer.borderWidth = 1.0
        titleLabel.layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }
    
    var setTitleText: String = "" {
        didSet {
            titleLabel.text = setTitleText
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderView", bundle: nil)
    }
}
