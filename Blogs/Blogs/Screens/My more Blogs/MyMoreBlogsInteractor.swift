//
//  MyMoreBlogsInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class MyMoreBlogsInteractor {
	weak var output: MyMoreBlogsInteractorOutput?
    
    private let updateQueue = DispatchQueue(label: "updateQueueMyMoreBlogs",
                                            qos: .userInteractive,
                                            attributes: .concurrent,
                                            autoreleaseFrequency: .workItem)
}

extension MyMoreBlogsInteractor: MyMoreBlogsInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        
        if defaultUser.arrayBlogs.indices.contains(indexPath.row) {
            defaultUser.arrayBlogs[indexPath.row].deleteBlog()
            defaultUser.arrayBlogs.remove(at: indexPath.row)
            
            UserManager.updateBlogs(blogs: defaultUser.arrayBlogs, nameArray: "arrayBlogs", queue: updateQueue)
        }
        updateQueue.async {
            DispatchQueue.main.async {
                self.output?.indexDeleteReiceve(indexPath)
            }
        }

    }
    
    func getBlog(at indexPath: IndexPath) {
        
        let blog = defaultUser.arrayBlogs[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(defaultUser.arrayBlogs)
    }
}
