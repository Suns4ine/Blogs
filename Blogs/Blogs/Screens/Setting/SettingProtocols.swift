//
//  SettingProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

protocol SettingModuleInput {
	var moduleOutput: SettingModuleOutput? { get }
}

protocol SettingModuleOutput: class {
}

protocol SettingViewInput: class {
}

protocol SettingViewOutput: class {
    func didTapBackButton()
    func didTapSettingTableViewCell()
}

protocol SettingInteractorInput: class {
}

protocol SettingInteractorOutput: class {
}

protocol SettingRouterInput: class {
    func popViewController()
}
