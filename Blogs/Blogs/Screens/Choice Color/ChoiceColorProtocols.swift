//
//  ChoiceColorProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol ChoiceColorModuleInput {
	var moduleOutput: ChoiceColorModuleOutput? { get }
}

protocol ChoiceColorModuleOutput: class {
}

protocol ChoiceColorViewInput: class {
    func reloadData(for section: ChoiceSectionViewModel)
}

protocol ChoiceColorViewOutput: class {
    func fetchChoicesCell()
    func didTapBackButton()
    func didTapColorTableViewCell(at indexPath: Int)
}

protocol ChoiceColorInteractorInput: class {
    func getChoice(at indexPath: Int)
    func fetchChoices()
}

protocol ChoiceColorInteractorOutput: class {
    func choicesDidRecieve(_ choices: [Choice])
    func choiceDidRecieve(_ choice: Choice)
}

protocol ChoiceColorRouterInput: class {
    func popViewController()
}
