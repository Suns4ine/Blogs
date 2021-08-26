//
//  AnotherProfileInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class AnotherProfileInteractor {
	weak var output: AnotherProfileInteractorOutput?
    
    
    private var arrayBlogs: [Blog] = [.init(), .init(), .init(), .init(), .init()] 
}

extension AnotherProfileInteractor: AnotherProfileInteractorInput {
    func giveBlogsArrayCount() -> Int {
        return arrayBlogs.count
    }
    
    func getBlog(at indexPath: IndexPath) {
        let blog = arrayBlogs[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(arrayBlogs)
    }
}
