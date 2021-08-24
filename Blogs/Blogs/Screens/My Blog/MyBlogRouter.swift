//
//  MyBlogRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class MyBlogRouter {
    weak var sourceViewController: UIViewController?
}

extension MyBlogRouter: MyBlogRouterInput {
    
    func openCreateBlogViewController() {
        let container = CreateBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
