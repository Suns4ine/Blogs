//
//  MyProfileProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import Foundation

protocol MyProfileModuleInput {
	var moduleOutput: MyProfileModuleOutput? { get }
}

protocol MyProfileModuleOutput: class {
}

protocol MyProfileViewInput: class {
}

protocol MyProfileViewOutput: class {
}

protocol MyProfileInteractorInput: class {
}

protocol MyProfileInteractorOutput: class {
}

protocol MyProfileRouterInput: class {
}
