//
//  UIViewExtension.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

extension UIView {
    
    private func makeRound(isRound:  Bool) {
        guard isRound else {
            self.clipsToBounds = false
            self.layer.cornerRadius = 0
            return
        }
        
        self.clipsToBounds = true
        self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
    }
    
    @IBInspectable var round: Bool {
        set {
            makeRound(isRound: newValue)
        }
        get {
            return self.round
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
