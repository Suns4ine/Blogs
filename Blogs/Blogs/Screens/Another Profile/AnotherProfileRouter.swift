//
//  AnotherProfileRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AnotherProfileRouter {
    weak var sourceViewController: UIViewController?
}

extension AnotherProfileRouter: AnotherProfileRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
    
    func openAnotherMoreBlogsViewController() {
        
    }
    
}
