//
//  SignUpRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class SignUpRouter {
    weak var sourceViewController: UIViewController?
}

extension SignUpRouter: SignUpRouterInput {
    func openTabBarViewController() {
        let tabBarController = TabBarController()
        self.sourceViewController?.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
