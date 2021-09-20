//
//  SnapahotTests.swift
//  BlogsUITests
//
//  Created by Vyacheslav Pronin on 20.09.2021.
//

import XCTest
import SnapshotTesting

@testable import Blogs

final class SnapshotTests: XCTestCase {
    
    var loginContainer: LoginContainer!
    var controller: UIViewController!
    
    
    func testLoginController() {
        loginContainer = LoginContainer.assemble(with: .init())
        controller = loginContainer.viewController

        assertSnapshot(matching: controller, as: .image(on: .iPhoneSe))
    }

}
