//
//  ViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit

class StartViewController: UIViewController {

    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "peep-sitting-2")
        imageView.frame = CGRect(x: 100, y: 100, width: 206, height: 285)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .firstBlue
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(image)
    }

}

