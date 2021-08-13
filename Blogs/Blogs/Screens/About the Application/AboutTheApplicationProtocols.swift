//
//  AboutTheApplicationProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol AboutTheApplicationModuleInput {
	var moduleOutput: AboutTheApplicationModuleOutput? { get }
}

protocol AboutTheApplicationModuleOutput: class {
}

protocol AboutTheApplicationViewInput: class {
}

protocol AboutTheApplicationViewOutput: class {
}

protocol AboutTheApplicationInteractorInput: class {
}

protocol AboutTheApplicationInteractorOutput: class {
}

protocol AboutTheApplicationRouterInput: class {
}
