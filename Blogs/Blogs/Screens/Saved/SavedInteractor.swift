//
//  SavedInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

final class SavedInteractor {
	weak var output: SavedInteractorOutput?
}

extension SavedInteractor: SavedInteractorInput {
}
