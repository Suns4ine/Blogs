//
//  AdditionBlogContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AdditionBlogContainer {
    let input: AdditionBlogModuleInput
	let viewController: UIViewController
	private(set) weak var router: AdditionBlogRouterInput!

	class func assemble(with context: AdditionBlogContext) -> AdditionBlogContainer {
        let router = AdditionBlogRouter()
        let interactor = AdditionBlogInteractor()
        let presenter = AdditionBlogPresenter(router: router, interactor: interactor)
		let viewController = AdditionBlogViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AdditionBlogContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AdditionBlogModuleInput, router: AdditionBlogRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AdditionBlogContext {
	weak var moduleOutput: AdditionBlogModuleOutput?
}
