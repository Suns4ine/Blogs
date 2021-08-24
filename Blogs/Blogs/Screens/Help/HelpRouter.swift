//
//  HelpRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class HelpRouter {
    weak var sourceViewController: UIViewController?
}

extension HelpRouter: HelpRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
