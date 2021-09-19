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
    private var allArrayBlogs: [Blog]  = User.arrayAnotherBlogs()
    private lazy var searchArray: [Blog] = allArrayBlogs
}

extension SearchInteractor: SearchInteractorInput {
    func getWord(word: String) {
        let text = word.trimmingCharacters(in: .whitespaces).lowercased()
        
        if text.isEmpty {
            searchArray = allArrayBlogs
        } else {
            searchBlogs(word: text)
        }
        
    }
    
    func getBlog(at indexPath: IndexPath) {
        let blog = searchArray[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(searchArray)
    }
    
    func searchBlogs(word: String) {
        
        var array: [Blog] = []

        for blog in allArrayBlogs {
            if blog.title.lowercased().contains(word) {
                array.append(blog)
            }
        }
        
        searchArray = array
        fetchBlogs()
    }
}
