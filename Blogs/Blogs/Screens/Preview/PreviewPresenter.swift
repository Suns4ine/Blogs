//
//  PreviewPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import Foundation
import UIKit

final class PreviewPresenter {
	weak var view: PreviewViewInput?
    weak var moduleOutput: PreviewModuleOutput?

	private let router: PreviewRouterInput
	private let interactor: PreviewInteractorInput

    init(router: PreviewRouterInput, interactor: PreviewInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension PreviewPresenter: PreviewModuleInput {
}

extension PreviewPresenter: PreviewViewOutput {
    func didTapTralingButton() {
        debugPrint("didTapTralingButton")
    }
    
    func didTapLeadingButton() {
        router.openStartViewController()
    }
    
    func didTapStartButton() {
        router.openStartViewController()
    }
    
}

extension PreviewPresenter: PreviewInteractorOutput {
}
