//
//  ViewController.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/03/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
        setupDropDownLayer()
    }
    
    @IBAction func didTapDropDownButton(_ sender: UIButton) {
        if tableView.isHidden {
            dropDownAnimate(toggle: true)
        } else {
            dropDownAnimate(toggle: false)
        }
    }
    
    private func dropDownAnimate(toggle: Bool) {
        if toggle {
            //ドロップダウンリストが閉じている時
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = false
                self.dropDownButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            }
        } else {
            //ドロップダウンリストが開いている時
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = true
                self.dropDownButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            }
        }
    }
    
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // 横スクロール
        layout.itemSize = CGSize(width: 180, height: 40)
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        collectionView.backgroundColor = .clear
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DropDownListTableViewCell", bundle: nil), forCellReuseIdentifier: "dropDownCell")
        tableView.isScrollEnabled = false
        tableView.isHidden = true
    }
    
    private func setupDropDownLayer() {
        dropDownStackView.layer.cornerRadius = dropDownButton.frame.height / 2
        dropDownStackView.clipsToBounds = true
        dropDownStackView.layer.borderWidth = 1.0
        dropDownStackView.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) //.systemPink
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.setCategoryButtonTitle = categoryType.init(rawValue: indexPath.row)?.categoryTitle ?? ""
        return cell
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryType.anime.movies.count - 1 //元からあるボタン分を引く
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dropDownCell", for: indexPath) as! DropDownListTableViewCell
        cell.setTitleText = categoryType.anime.movies[indexPath.row + 1]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 40
        return cellHeight
    }
}
