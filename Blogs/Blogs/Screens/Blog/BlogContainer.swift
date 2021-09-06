//
//  BlogContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import UIKit

final class BlogContainer {
    let input: BlogModuleInput
	let viewController: UIViewController
	private(set) weak var router: BlogRouterInput!

	class func assemble(with context: BlogContext) -> BlogContainer {
        let router = BlogRouter()
        let interactor = BlogInteractor()
        let presenter = BlogPresenter(router: router, interactor: interactor)
		let viewController = BlogViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return BlogContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: BlogModuleInput, router: BlogRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct BlogContext {
	weak var moduleOutput: BlogModuleOutput?
}
