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
}


// MARK: CharacterViewInterface

extension CharacterViewController: CharacterViewInterface {
    func setupContent() {
        
    }
}
