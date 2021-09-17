//
//  AnotherMoreBlogsInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class AnotherMoreBlogsInteractor {
	weak var output: AnotherMoreBlogsInteractorOutput?
    
    
    private var blogArray: [Blog]?
}

extension AnotherMoreBlogsInteractor: AnotherMoreBlogsInteractorInput {
    func setupArrayBlogs(array: [Blog]) {
        blogArray = array
    }
    
    func getBlog(at indexPath: IndexPath) {
        guard let blogArray = blogArray  else { return }
        let blog = blogArray[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        guard let blogArray = blogArray  else { return }
        output?.blogsDidRecieve(blogArray)
    }
}
