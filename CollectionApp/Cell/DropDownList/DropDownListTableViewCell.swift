//
//  DropDownListTableViewCell.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/04/06.
//

import UIKit

class DropDownListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var setTitleText: String = "" {
        didSet {
            titleLabel.text = setTitleText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
