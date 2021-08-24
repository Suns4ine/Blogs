//
//  AdditionBlogRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AdditionBlogRouter {
    weak var sourceViewController: UIViewController?
}

extension AdditionBlogRouter: AdditionBlogRouterInput {
    
    func openMyProfileViewController() {
        let tabBarController = TabBarController()
        tabBarController.selectedIndex = 3
        self.sourceViewController?.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
