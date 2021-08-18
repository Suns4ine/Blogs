//
//  PreviewProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import Foundation

protocol PreviewModuleInput {
	var moduleOutput: PreviewModuleOutput? { get }
}

protocol PreviewModuleOutput: class {
}

protocol PreviewViewInput: class {
}

protocol PreviewViewOutput: class {
}

protocol PreviewInteractorInput: class {
}

protocol PreviewInteractorOutput: class {
}

protocol PreviewRouterInput: class {
}
