//
//  AnotherMoreBlogsContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class AnotherMoreBlogsContainer {
    let input: AnotherMoreBlogsModuleInput
	let viewController: UIViewController
	private(set) weak var router: AnotherMoreBlogsRouterInput!

	class func assemble(with context: AnotherMoreBlogsContext) -> AnotherMoreBlogsContainer {
        let router = AnotherMoreBlogsRouter()
        let interactor = AnotherMoreBlogsInteractor()
        let presenter = AnotherMoreBlogsPresenter(router: router, interactor: interactor)
		let viewController = AnotherMoreBlogsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return AnotherMoreBlogsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AnotherMoreBlogsModuleInput, router: AnotherMoreBlogsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AnotherMoreBlogsContext {
	weak var moduleOutput: AnotherMoreBlogsModuleOutput?
}
