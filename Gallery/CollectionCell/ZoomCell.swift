//
//  ZoomCell.swift
//  Gallery
//
//  Created by Taof on 6/2/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class ZoomCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    var gallery: Photo? {
        didSet {
            if let gallery = gallery {
                photoImageView.image = gallery.image
            }
        }
    }
    var isZoom: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
