//
//  HomeFactory.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 04/12/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class HomeFactory {
    static func make() -> UIViewController  {
        let coordinator = HomeCoordinator()
        let interactor = HomeInteractor(coordinator: coordinator)
        let presenter = HomePresenter(interactor: interactor)
        let viewController = HomeViewController(presenter: presenter)
        coordinator.baseViewController = viewController
        return viewController
    }
}

extension UIViewController {
    func presentHome() {
        let homeViewController = HomeFactory.make()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
