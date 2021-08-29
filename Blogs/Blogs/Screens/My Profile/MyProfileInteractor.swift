//
//  MyProfileInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import Foundation

final class MyProfileInteractor {
	weak var output: MyProfileInteractorOutput?
    
    private var arrayBlogs: [Blog] = defaultUser.arrayBlogs//[defaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog]//[.init(), .init(), .init(), .init(), .init()]
}
//MARK: Убрать дефолтного юзера
extension MyProfileInteractor: MyProfileInteractorInput {
    func giveMyProfile() {
        output?.giveAwayMyProfile(profile: defaultUser)
    }
    
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
