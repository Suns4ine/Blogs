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
    
    private var savedArray: [Blog] = [.init(), .init(), .init(), .init(), .init(), .init()] 
}

extension SavedInteractor: SavedInteractorInput {
    
    func getBlog(at indexPath: IndexPath) {
        let blog = savedArray[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(savedArray)
    }
}
