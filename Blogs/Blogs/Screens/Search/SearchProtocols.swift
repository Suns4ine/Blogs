//
//  SearchProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

protocol SearchModuleInput {
	var moduleOutput: SearchModuleOutput? { get }
}

protocol SearchModuleOutput: class {
}

protocol SearchViewInput: class {
}

protocol SearchViewOutput: class {
    func didTapSettingButton()
    func didTapBlogsTableViewCell()
}

protocol SearchInteractorInput: class {
}

protocol SearchInteractorOutput: class {
}

protocol SearchRouterInput: class {
    func openSettingViewController()
}
