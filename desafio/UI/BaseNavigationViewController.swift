//
//  BaseNavigationViewController.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import UIKit

public class BaseNavigationViewController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBackgorund()
    }
    
    public func configureNavigationBackgorund() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().backgroundColor = .purple
    }
}
