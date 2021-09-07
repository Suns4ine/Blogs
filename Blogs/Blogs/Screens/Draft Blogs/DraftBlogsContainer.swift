//
//  DraftBlogsContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class DraftBlogsContainer {
    let input: DraftBlogsModuleInput
	let viewController: UIViewController
	private(set) weak var router: DraftBlogsRouterInput!

	class func assemble(with context: DraftBlogsContext) -> DraftBlogsContainer {
        let router = DraftBlogsRouter()
        let interactor = DraftBlogsInteractor()
        let presenter = DraftBlogsPresenter(router: router, interactor: interactor)
		let viewController = DraftBlogsViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return DraftBlogsContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: DraftBlogsModuleInput, router: DraftBlogsRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct DraftBlogsContext {
	weak var moduleOutput: DraftBlogsModuleOutput?
}
