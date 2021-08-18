//
//  PreviewInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import Foundation

final class PreviewInteractor {
	weak var output: PreviewInteractorOutput?
}

extension PreviewInteractor: PreviewInteractorInput {
}
