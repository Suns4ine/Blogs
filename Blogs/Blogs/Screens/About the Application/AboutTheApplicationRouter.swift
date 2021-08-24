//
//  AboutTheApplicationRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AboutTheApplicationRouter {
    weak var sourceViewController: UIViewController?
}

extension AboutTheApplicationRouter: AboutTheApplicationRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
