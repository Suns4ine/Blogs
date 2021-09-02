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
    func setupFinalChanges()
    func reloadData(for section: PageSectionViewModel)
}

protocol PreviewViewOutput: class {
    func newPage(numb: Int)
    func fetchViewPages()
    func didTapTralingButton()
    func didTapLeadingButton()
    func didTapStartButton()
}

protocol PreviewInteractorInput: class {
    func fetchPage(numb: Int)
    func fetchPages()
}

protocol PreviewInteractorOutput: class {
    func pagesDidRecieve(_ pages: [Page])
    func finalChanges()
}

protocol PreviewRouterInput: class {
    func openStartViewController()
}
