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
    
    @IBAction func readWikiButtonClicked() {
        eventHandler?.readWikiButtonClicked()
    }
    
    var character: Character?
    private var eventHandler: CharacterViewHandlerInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = CharacterPresenter(userInterface: self)
        eventHandler?.viewDidLoad(with: character)
    }
}


// MARK: CharacterViewInterface

extension CharacterViewController: CharacterViewInterface {
    func setNavigationTitle(with value: String) {
        self.navigationItem.title = value
    }
    
    func setImageLayout() {
        let maskLayer = CAGradientLayer()
        maskLayer.frame = characterLandscapeImage.bounds
        maskLayer.shadowRadius = 5
        maskLayer.shadowPath = CGPath(roundedRect: characterLandscapeImage.bounds.insetBy(dx: 5, dy: 5), cornerWidth: 10, cornerHeight: 10, transform: nil)
        maskLayer.shadowOpacity = 1;
        maskLayer.shadowOffset = CGSize.zero;
        maskLayer.shadowColor = UIColor(named: Constants.COLOR.BACKGROUND)?.cgColor
        
        characterLandscapeImage.layer.mask = maskLayer;
    }
    
    func setCharacterImage(with value: URL?) {
        characterLandscapeImage.kf.setImage(with: value
            , placeholder: UIImage(named: Constants.IMAGE.APP_ICON)
            , options: [
                .transition(.fade(1))
            ], progressBlock: nil, completionHandler: nil)
    }
    
    func setCharacterNameLabel(with value: String) {
        characterNameLabel.text = value
    }
    
    func setCharacterDescriptionLabel(with value: String) {
        characterDescriptionLabel.text = value
    }
    
    func setCharacterComicsLabel(with value: String) {
        characterComicsLabel.text = value
    }
    
    func setCharacterSeriesLabel(with value: String) {
        characterSeriesLabel.text = value
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
    
    func openURL(with value: URL) {
        UIApplication.shared.open(value, options: [:], completionHandler: nil)
    }
}
