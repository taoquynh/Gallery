//
//  ViewController.swift
//  Gallery
//
//  Created by Taof on 5/30/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let collectionViewGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    var datas = fakeData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupLayout()
        registerCell()
        delegateCollection()
        
    }
    
    // thêm các đối tượng vào superview
    func addSubview(){
        view.addSubview(collectionViewGallery)
    }
    
    // layout collectionView
    func setupLayout(){
        NSLayoutConstraint.activate([
            collectionViewGallery.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            collectionViewGallery.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionViewGallery.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewGallery.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    // gán delegate cho UICollectionView
    func delegateCollection(){
        collectionViewGallery.delegate = self
        collectionViewGallery.dataSource = self
    }
    
    // đăng ký cell
    func registerCell(){
        collectionViewGallery.register(UINib(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCell")
        collectionViewGallery.register(UINib(nibName: "HeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas[section].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        cell.gallery = datas[indexPath.section].images[indexPath.item]
        cell.onPress = { [weak self] in
            guard let strongSelf = self else { return }
            
            
            strongSelf.collectionViewGallery.reloadData()
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width/5
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.index = indexPath.item
        detailVC.section = indexPath.section
        detailVC.datas = datas
        let navigation = UINavigationController(rootViewController: detailVC)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
        reusableview.nameLabel.text = datas[indexPath.section].dateTime
        return reusableview
    }
    
}

