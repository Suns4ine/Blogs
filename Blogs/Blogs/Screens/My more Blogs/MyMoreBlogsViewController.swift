//
//  MyMoreBlogsViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class MyMoreBlogsViewController: UIViewController {
	private let output: MyMoreBlogsViewOutput

    init(output: MyMoreBlogsViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension MyMoreBlogsViewController: MyMoreBlogsViewInput {
}
