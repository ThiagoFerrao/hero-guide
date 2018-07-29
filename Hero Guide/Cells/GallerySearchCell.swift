//
//  GallerySearchCell.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 29/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit
import Kingfisher

class GallerySearchCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override var isHighlighted: Bool {
        didSet {
            guard isHighlighted else {
                contentView.alpha = Constants.ALPHA.ENABLE
                return
            }
            
            contentView.alpha = Constants.ALPHA.DISABLE
        }
    }
    
    var character: CharacterData? {
        didSet {
            characterNameLabel.text = character?.name
            
            let imageURL = character?.getStandardImageURL()
            
            characterImage.kf.setImage(with: imageURL
                , placeholder: UIImage(named: Constants.IMAGE.APP_ICON)
                , options: [
                    .transition(.fade(1))
                ], progressBlock: nil, completionHandler: nil)
        }
    }
}
