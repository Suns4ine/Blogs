//
//  ChoiceLanguageRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class ChoiceLanguageRouter {
    weak var sourceViewController: UIViewController?
}

extension ChoiceLanguageRouter: ChoiceLanguageRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
