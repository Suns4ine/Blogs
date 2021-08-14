//
//  CreateBlogContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class CreateBlogContainer {
    let input: CreateBlogModuleInput
	let viewController: UIViewController
	private(set) weak var router: CreateBlogRouterInput!

	class func assemble(with context: CreateBlogContext) -> CreateBlogContainer {
        let router = CreateBlogRouter()
        let interactor = CreateBlogInteractor()
        let presenter = CreateBlogPresenter(router: router, interactor: interactor)
		let viewController = CreateBlogViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return CreateBlogContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: CreateBlogModuleInput, router: CreateBlogRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct CreateBlogContext {
	weak var moduleOutput: CreateBlogModuleOutput?
}
