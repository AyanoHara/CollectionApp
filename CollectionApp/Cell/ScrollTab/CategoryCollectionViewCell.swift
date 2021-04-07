//
//  CategoryCollectionViewCell.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/03/07.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        makeBottomBorder(borderWidth: 5.0)
        categoryButton.layer.cornerRadius = 4.0
        categoryButton.clipsToBounds = true
        categoryButton.layer.borderWidth = 4.0
        categoryButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    var setCategoryButtonTitle: String = "" {
        didSet {
            categoryButton.setTitle(setCategoryButtonTitle, for: .normal)
        }
    }
    
    @IBAction func didTapCategoryButton(_ sender: UIButton) {
        print(sender.titleLabel!.text as Any)
    }
    
//    private func makeBottomBorder(borderWidth: CGFloat) {
//        //下線のCALayerを作成
//        let bottomBorder = CALayer()
//        bottomBorder.frame = CGRect(x: 0, y: categoryButton.frame.height - borderWidth, width: categoryButton.frame.width, height:borderWidth)
//        bottomBorder.backgroundColor = UIColor.red.cgColor
//        categoryButton.layer.addSublayer(bottomBorder)
//    }
}
