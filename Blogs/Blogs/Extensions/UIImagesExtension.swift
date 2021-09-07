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
    
    func randomProfilePeople() -> UIImage {
        let numb = Int.random(in: 1...105)
        
        return UIImage(named: "peep-\(numb)") ?? UIImage.init()
    }
    
    func randomSittingPeople() -> UIImage {
        let numb = Int.random(in: 1...18)
        
        return UIImage(named: "peep-sitting-\(numb)") ?? UIImage.init()
    }
}
