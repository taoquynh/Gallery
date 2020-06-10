//
//  Modal.swift
//  Gallery
//
//  Created by Taof on 5/30/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import Foundation
import UIKit

struct Gallery {
    var dateTime: String
    var images: [Photo]
}

struct Photo {
    var image: UIImage
    var isSelect: Bool
}

func fakeData() -> [Gallery] {
    return [
        Gallery(dateTime: "Hôm nay", images: [
            Photo(image: UIImage(named: "salf")!, isSelect: false),
            Photo(image: UIImage(named: "kochia")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "field-tulip")!, isSelect: false),
            Photo(image: UIImage(named: "kochia")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "salf")!, isSelect: false),
            Photo(image: UIImage(named: "kochia")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
        ]),
        Gallery(dateTime: "Hôm qua", images: [
            Photo(image: UIImage(named: "flutter")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "field-tulip")!, isSelect: false)
        ]),
        Gallery(dateTime: "Th2, 1 thg 6", images: [
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "field-tulip")!, isSelect: false),
            Photo(image: UIImage(named: "salf")!, isSelect: false),
            Photo(image: UIImage(named: "kochia")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "field-tulip")!, isSelect: false),
            Photo(image: UIImage(named: "kochia")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "salf")!, isSelect: false),
            Photo(image: UIImage(named: "kochia")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "field-flower")!, isSelect: false),
            Photo(image: UIImage(named: "field-tulip")!, isSelect: false)
        ])
        
    ]
}
