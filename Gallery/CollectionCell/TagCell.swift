//
//  TagCell.swift
//  Gallery
//
//  Created by Taof on 5/30/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }

}
