//
//  GalleryCell.swift
//  Gallery
//
//  Created by Taof on 5/30/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var checkImageView: UIImageView!
    var onPress: (() -> Void)?
    var isLongPress: Bool = false
    
    var gallery: Photo? {
        didSet {
            if let gallery = gallery {
                photoImageView.image = gallery.image
                isLongPress = gallery.isSelect
                if isLongPress {
                    photoImageView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                    checkImageView.isHidden = isLongPress
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkImageView.isHidden = true
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLong))
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(longGesture)
    }
    
    @objc func onLong(){
        print("a")
        onPress?()
    }

}
