//
//  MyBlogContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class MyBlogContainer {
    let input: MyBlogModuleInput
	let viewController: UIViewController
	private(set) weak var router: MyBlogRouterInput!

	class func assemble(with context: MyBlogContext) -> MyBlogContainer {
        let router = MyBlogRouter()
        let interactor = MyBlogInteractor()
        let presenter = MyBlogPresenter(router: router, interactor: interactor)
		let viewController = MyBlogViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return MyBlogContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: MyBlogModuleInput, router: MyBlogRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct MyBlogContext {
	weak var moduleOutput: MyBlogModuleOutput?
}
