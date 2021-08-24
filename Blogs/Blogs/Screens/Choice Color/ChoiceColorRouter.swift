//
//  ChoiceColorRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class ChoiceColorRouter {
    weak var sourceViewController: UIViewController?
}

extension ChoiceColorRouter: ChoiceColorRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
