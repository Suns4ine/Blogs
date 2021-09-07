//
//  PreviewRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import UIKit

final class PreviewRouter {
    weak var sourceViewController: UIViewController?
}

extension PreviewRouter: PreviewRouterInput {
    func openStartViewController() {
        let container = StartContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
}
