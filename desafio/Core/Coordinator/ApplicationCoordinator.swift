//
//  ApplicationCoordinator.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import Foundation
import UIKit

public protocol Coordinator {
    func start()
}

class ApplicationCoordinator: Coordinator {
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private var catalogCoordinator: CatalogCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = BaseNavigationViewController()
        catalogCoordinator = CatalogCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        catalogCoordinator.start()
        window.makeKeyAndVisible()
    }
}
