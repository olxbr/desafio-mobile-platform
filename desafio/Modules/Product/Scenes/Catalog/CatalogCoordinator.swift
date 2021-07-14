//
//  CatalogCoordinator.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import Foundation
import UIKit

class CatalogCoordinator: Coordinator {
    private var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewController = CatalogViewController()
        self.presenter.pushViewController(viewController, animated: true)
    }
    
    func popView() {
        self.presenter.popViewController(animated: true)
    }
}
