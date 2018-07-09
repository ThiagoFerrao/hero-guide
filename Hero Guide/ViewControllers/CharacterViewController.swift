//
//  CharacterViewController.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var characterLandscapeImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    @IBOutlet weak var characterComicsLabel: UILabel!
    @IBOutlet weak var characterSeriesLabel: UILabel!
    
    var character: Character?
    private var eventHandler: CharacterViewHandlerInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = CharacterPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
    
    
    // MARK: Private Methods
    
    private func setupNavigationTitle() {
        self.navigationItem.title = character?.name
    }
    
    private func setupImageViewLayerMask() {
        let maskLayer = CAGradientLayer()
        maskLayer.frame = characterLandscapeImage.bounds
        maskLayer.shadowRadius = 5
        maskLayer.shadowPath = CGPath(roundedRect: characterLandscapeImage.bounds.insetBy(dx: 5, dy: 5), cornerWidth: 10, cornerHeight: 10, transform: nil)
        maskLayer.shadowOpacity = 1;
        maskLayer.shadowOffset = CGSize.zero;
        maskLayer.shadowColor = UIColor(named: Constants.COLOR.BACKGROUND)?.cgColor
        
        characterLandscapeImage.layer.mask = maskLayer;
    }
}


// MARK: CharacterViewInterface

extension CharacterViewController: CharacterViewInterface {
    func setupContent() {
        setupNavigationTitle()
        setupImageViewLayerMask()
    }
}
