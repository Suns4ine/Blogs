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
}

protocol ChoiceColorViewOutput: class {
    func didTapBackButton()
    func didTapColorTableViewCell()
}

protocol ChoiceColorInteractorInput: class {
}

protocol ChoiceColorInteractorOutput: class {
}

protocol ChoiceColorRouterInput: class {
    func popViewController()
}
