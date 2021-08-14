//
//  MyBlogInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class MyBlogInteractor {
	weak var output: MyBlogInteractorOutput?
}

extension MyBlogInteractor: MyBlogInteractorInput {
}
