//
//  PreviewContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import UIKit

final class PreviewContainer {
    let input: PreviewModuleInput
	let viewController: UIViewController
	private(set) weak var router: PreviewRouterInput!

	class func assemble(with context: PreviewContext) -> PreviewContainer {
        let router = PreviewRouter()
        let interactor = PreviewInteractor()
        let presenter = PreviewPresenter(router: router, interactor: interactor)
		let viewController = PreviewViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return PreviewContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: PreviewModuleInput, router: PreviewRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct PreviewContext {
	weak var moduleOutput: PreviewModuleOutput?
}
