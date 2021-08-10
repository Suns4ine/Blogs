//
//  UIImagesExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    func randomStandingPeople() -> UIImage {
        let numb = Int.random(in: 1...30)
        
        return UIImage(named: "peep-standing-\(numb)") ?? UIImage.init()
    }
}
