//
//  HomeProtocol.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 04/12/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

protocol HomeCoordinating: AnyObject {
    init()
    var baseViewController: UIViewController? { get }
}

protocol HomeInteracting: AnyObject {
    init(coordinator: HomeCoordinating)
}

protocol HomePresenting: AnyObject {
    init(interactor: HomeInteracting)
}

protocol HomeViewing: AnyObject {
    init(presenter: HomePresenting)
}
