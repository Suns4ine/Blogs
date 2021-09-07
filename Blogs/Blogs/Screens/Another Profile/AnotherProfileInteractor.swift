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
    
    
    private var arrayBlogs: [Blog] = []//[defaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog]//[.init(), .init(), .init(), .init(), .init()]
    //anotherDefaultUser.arrayBlogs
}

//MARK: Удалить дефелтного юзера
extension AnotherProfileInteractor: AnotherProfileInteractorInput {
    func giveStatus() {
        if defaultUser.arrayFolloving.contains(anotherDefaultUser) {
            output?.updateStatus(text: StandartLanguage.statusOnFollowButtonAnotherProfileScreen)
        } else {
            output?.updateStatus(text: StandartLanguage.statusOffFollowButtonAnotherProfileScreen)
        }
    }
    
    func subscribe() {
        
        if defaultUser.arrayFolloving.contains(anotherDefaultUser),
           anotherDefaultUser.arrayFollowers.contains(defaultUser) {
            
            defaultUser.arrayFolloving.remove(anotherDefaultUser)
            anotherDefaultUser.arrayFollowers.remove(defaultUser)
        } else {
            if defaultUser.arrayFolloving.count < 2500 {
                
                defaultUser.arrayFolloving.insert(anotherDefaultUser)
                anotherDefaultUser.arrayFollowers.insert(defaultUser)
            }
        }
        fetchBlogs()
        giveStatus()
        giveAnotherProfile()
    }
    
    func giveAnotherProfile() {
        output?.giveAwayAnotherProfile(profile: anotherDefaultUser)
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
