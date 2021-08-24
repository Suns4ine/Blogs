//
//  SearchPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

final class SearchPresenter {
	weak var view: SearchViewInput?
    weak var moduleOutput: SearchModuleOutput?

	private let router: SearchRouterInput
	private let interactor: SearchInteractorInput

    init(router: SearchRouterInput, interactor: SearchInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SearchPresenter: SearchModuleInput {
}

extension SearchPresenter: SearchViewOutput {
    func didTapSettingButton() {
        router.openSettingViewController()
    }
    
    func didTapBlogsTableViewCell() {
        debugPrint("didTapBlogsTableViewCell")
    }
    
}

extension SearchPresenter: SearchInteractorOutput {
}
