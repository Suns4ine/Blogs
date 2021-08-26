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
    func reloadData(for section: ChoiceSectionViewModel)
}

protocol ChoiceLanguageViewOutput: class {
    func fetchChoicesCell()
    func didTapBackButton()
    func didTapLanguageTableViewCell(at indexPath: Int)
}

protocol ChoiceLanguageInteractorInput: class {
    func getChoice(at indexPath: Int)
    func fetchChoices()
}

protocol ChoiceLanguageInteractorOutput: class {
    func choicesDidRecieve(_ choices: [Choice])
    func choiceDidRecieve(_ choice: Choice)
}

protocol ChoiceLanguageRouterInput: class {
    func popViewController()
}
