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
    private var searchArray: [Blog] = [.init(), .init(), .init(), .init(), .init()]
}

extension SearchInteractor: SearchInteractorInput {
    func getBlog(at indexPath: IndexPath) {
        let blog = searchArray[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(searchArray)
    }
    
}
