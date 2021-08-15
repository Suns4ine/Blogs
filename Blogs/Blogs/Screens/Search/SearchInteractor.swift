//
//  SearchInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

final class SearchInteractor {
	weak var output: SearchInteractorOutput?
}

extension SearchInteractor: SearchInteractorInput {
}
