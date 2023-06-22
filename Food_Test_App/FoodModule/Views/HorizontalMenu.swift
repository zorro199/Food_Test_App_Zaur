//
//  Menu.swift
//  Food_Test_App
//
//  Created by Zaur on 04.04.2023.
//

import UIKit

protocol selectedItemProtocol: AnyObject {
    func selectItem(indexPath: IndexPath)
}

class HorizontalMenu: UIViewController{
    
    var collectionView: UICollectionView!
    
    private let names = ["Разное", "Пицца", "Комбо", "Десерты", "Напитки"]
    
    weak var cellDelegate: selectedItemProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Colors.barColor
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.backgroundColor = R.Colors.barColor
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.selectItem(at: [0,0], animated: true, scrollPosition: [])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        return layout
    }
}

extension HorizontalMenu: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseId, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
        cell.nameLabel.text = names[indexPath.item]
        return cell
    }
}

extension HorizontalMenu: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cellDelegate?.selectItem(indexPath: indexPath)
    }
    
}

extension HorizontalMenu: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Arial Bold", size: 18 )
        let attr = [NSAttributedString.Key.font : font as Any]
        let width = names[indexPath.item].size(withAttributes: attr).width
        
        return CGSize(width: width + 60, height: collectionView.frame.height)
    }
    
}


