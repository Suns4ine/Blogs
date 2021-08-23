//
//  PreviewProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import Foundation
import UIKit

protocol PreviewModuleInput {
	var moduleOutput: PreviewModuleOutput? { get }
}

protocol PreviewModuleOutput: class {
}

protocol PreviewViewInput: class {
    func presentViewController()
}

protocol PreviewViewOutput: class {
    func didTapTralingButton()
    func didTapLeadingButton()
    func didTapStartButton()
}

protocol PreviewInteractorInput: class {
}

protocol PreviewInteractorOutput: class {
}

protocol PreviewRouterInput: class {
    func openStartViewController()
}
