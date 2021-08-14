//
//  AnotherBlogContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AnotherBlogContainer {
    let input: AnotherBlogModuleInput
	let viewController: UIViewController
	private(set) weak var router: AnotherBlogRouterInput!

	class func assemble(with context: AnotherBlogContext) -> AnotherBlogContainer {
        let router = AnotherBlogRouter()
        let interactor = AnotherBlogInteractor()
        let presenter = AnotherBlogPresenter(router: router, interactor: interactor)
		let viewController = AnotherBlogViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AnotherBlogContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AnotherBlogModuleInput, router: AnotherBlogRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AnotherBlogContext {
	weak var moduleOutput: AnotherBlogModuleOutput?
}
