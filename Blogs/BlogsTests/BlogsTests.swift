//
//  BlogsTests.swift
//  BlogsTests
//
//  Created by Vyacheslav Pronin on 20.09.2021.
//


import XCTest

@testable import Blogs

class BlogsTests: XCTestCase {
    
    var loginContainer: LoginContainer!
    
    override func setUp() {
        loginContainer = LoginContainer.assemble(with: .init())
    }
}
