//
//  SecondViewController.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/03/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var lastContentOffset: CGFloat = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(HeaderView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        collectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        // レイアウト設定
        let layout = UICollectionViewFlowLayout()
        let cellSize: CGFloat = UIScreen.main.bounds.width / 2 - 12
        let margin: CGFloat = 8
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.sectionInset = UIEdgeInsets(top: 8, left: margin, bottom: margin, right: margin)
        layout.minimumInteritemSpacing = margin
        layout.minimumLineSpacing = margin
        collectionView.collectionViewLayout = layout
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categoryType.init(rawValue: 0)?.movies.count ?? 0 //後から変更
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Characters.anime[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        cell.setNameLabelText = Characters.anime[indexPath.section][indexPath.row]
        cell.setCharacterImage = Characters.images[indexPath.section][indexPath.row]
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else {
                fatalError("Could not find proper header")
            }
            header.setTitleText = (categoryType.init(rawValue: 0)?.movies[indexPath.section]) ?? "" //後から変更
            return header
        }
        return UICollectionReusableView()
    }
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            let headerSize = CGSize(width: self.view.frame.width, height: 113)
            return headerSize
        } else {
            let headerSize = CGSize(width: self.view.frame.width, height: 40)
            return headerSize
        }
    }
}

// MARK: - UIScrollView
extension SecondViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageVC = self.parent as! PageViewController
        let parentVC = pageVC.parent as! ViewController
        
        let dropDownInView = parentVC.dropDownButton.convert(parentVC.dropDownButton.frame, to: parentVC.view)
        let section = 1
        let indexPath = IndexPath(item: 0, section: section)
        guard let header = collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: indexPath) as? HeaderView else { return }
        let headerInView = collectionView.convert(header.frame, to: parentVC.view)
        
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            //通常スクロール
            if dropDownInView.intersects(headerInView) {
                parentVC.dropDownButton.setTitle(categoryType.anime.movies[section], for: .normal)
                print("dropDownInView: \(dropDownInView)")
                print("header: \(headerInView)")
            }
        }
        else if (self.lastContentOffset > scrollView.contentOffset.y) == true {
            //逆スクロール
            if dropDownInView.intersects(headerInView) {
                parentVC.dropDownButton.setTitle(categoryType.anime.movies[section - 1], for: .normal)
            }
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
}
