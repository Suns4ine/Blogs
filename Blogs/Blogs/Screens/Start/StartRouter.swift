//
//  StartRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class StartRouter {
    weak var sourceViewCintroller: UIViewController?
}

extension StartRouter: StartRouterInput {
    func openLoginViewController() {
        let container = LoginContainer.assemble(with: .init())
        
        sourceViewCintroller?.navigationController?.pushViewController(container.viewController, animated: true)
    }

}
