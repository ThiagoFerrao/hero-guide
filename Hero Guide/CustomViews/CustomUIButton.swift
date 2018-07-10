//
//  CustomUIButton.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class CustomUIButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            guard isHighlighted else {
                layer.borderColor = borderColor?.withAlphaComponent(Constants.ALPHA.ENABLE).cgColor
                return
            }
            
            layer.borderColor = borderColor?.withAlphaComponent(Constants.ALPHA.DISABLE).cgColor
        }
    }
}
