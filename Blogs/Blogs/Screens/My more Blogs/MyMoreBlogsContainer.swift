//
//  MyMoreBlogsContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class MyMoreBlogsContainer {
    let input: MyMoreBlogsModuleInput
	let viewController: UIViewController
	private(set) weak var router: MyMoreBlogsRouterInput!

	class func assemble(with context: MyMoreBlogsContext) -> MyMoreBlogsContainer {
        let router = MyMoreBlogsRouter()
        let interactor = MyMoreBlogsInteractor()
        let presenter = MyMoreBlogsPresenter(router: router, interactor: interactor)
		let viewController = MyMoreBlogsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return MyMoreBlogsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: MyMoreBlogsModuleInput, router: MyMoreBlogsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct MyMoreBlogsContext {
	weak var moduleOutput: MyMoreBlogsModuleOutput?
}
