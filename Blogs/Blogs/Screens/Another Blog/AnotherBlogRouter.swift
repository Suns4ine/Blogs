//
//  AnotherBlogRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AnotherBlogRouter {
    weak var sourceViewController: UIViewController?
}

extension AnotherBlogRouter: AnotherBlogRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
