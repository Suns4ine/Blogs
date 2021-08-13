//
//  AdditionBlogInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class AdditionBlogInteractor {
	weak var output: AdditionBlogInteractorOutput?
}

extension AdditionBlogInteractor: AdditionBlogInteractorInput {
}
