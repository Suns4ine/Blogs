//
//  SavedPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

final class SavedPresenter {
	weak var view: SavedViewInput?
    weak var moduleOutput: SavedModuleOutput?

	private let router: SavedRouterInput
	private let interactor: SavedInteractorInput

    init(router: SavedRouterInput, interactor: SavedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SavedPresenter: SavedModuleInput {
}

extension SavedPresenter: SavedViewOutput {
    func didTapSettingButton() {
        router.openSettingViewController()
    }
    
    func didTapSavedTableViewCell() {
        debugPrint("didTapSavedTableViewCell")
    }
    
}

extension SavedPresenter: SavedInteractorOutput {
}
