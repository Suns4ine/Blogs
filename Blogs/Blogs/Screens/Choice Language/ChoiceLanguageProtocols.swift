//
//  ChoiceLanguageProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol ChoiceLanguageModuleInput {
	var moduleOutput: ChoiceLanguageModuleOutput? { get }
}

protocol ChoiceLanguageModuleOutput: class {
}

protocol ChoiceLanguageViewInput: class {
}

protocol ChoiceLanguageViewOutput: class {
    func didTapBackButton()
    func didTapLanguageTableViewCell()
}

protocol ChoiceLanguageInteractorInput: class {
}

protocol ChoiceLanguageInteractorOutput: class {
}

protocol ChoiceLanguageRouterInput: class {
    func popViewController()
}
