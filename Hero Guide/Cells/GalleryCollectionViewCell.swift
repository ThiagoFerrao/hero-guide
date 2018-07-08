//
//  GalleryCollectionViewCell.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var character: Character? {
        didSet {
            
        }
    }
}
