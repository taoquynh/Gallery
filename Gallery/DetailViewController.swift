//
//  DetailViewController.swift
//  Gallery
//
//  Created by Taof on 6/2/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    var datas = [Gallery]()
    var index: Int = 0
    var section: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupLayout()
        registerCell()
        delegateCollection()
        
        let backButton = UIBarButtonItem(image: UIImage(named: "chevron-left"), style: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
     override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.scrollToItem(at: IndexPath(item: index, section: section), at: .centeredHorizontally, animated: false)
    }
    
    // khi view chuẩn bị xuất hiện sẽ setup các thuộc tính của navigationBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set cho navigationBar trong suốt để thấy ảnh ở background (cần đủ 3 dòng)
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    // thêm các đối tượng vào superview
    func addSubview(){
        view.addSubview(collectionView)
    }
    
    // layout collectionView
    func setupLayout(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    // gán delegate cho UICollectionView
    func delegateCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // đăng ký cell
    func registerCell(){
        collectionView.register(UINib(nibName: "ZoomCell", bundle: nil), forCellWithReuseIdentifier: "ZoomCell")
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas[section].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZoomCell", for: indexPath) as! ZoomCell
        cell.gallery = datas[indexPath.section].images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
