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
            debugPrint(defaultUser.arrayFolloving.count)
        
        } else {
            if defaultUser.arrayFolloving.count < 2500 {
                
                arrayBlogs.append(anotherDefaultBlog)
                arrayBlogs.append(anotherDefaultBlog)
                arrayBlogs.append(anotherDefaultBlog)
                arrayBlogs.append(anotherDefaultBlog)
                arrayBlogs.append(anotherDefaultBlog)
                
                defaultUser.arrayFolloving.insert(anotherDefaultUser)
                anotherDefaultUser.arrayFollowers.insert(defaultUser)
                debugPrint(defaultUser.arrayFolloving.count)
            
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
