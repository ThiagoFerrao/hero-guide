//
//  HomeViewController.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 04/12/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewing {
    required init(presenter: HomePresenting) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
