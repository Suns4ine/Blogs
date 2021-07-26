//
//  Icons.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

enum Icons {
    case facebook
    case twitter
    case email
    case none
}

func choiceIcon(icon: Icons) -> String {
    switch icon {
    case .email: return "mail"
    case .facebook: return "facebook"
    case .twitter: return "twitter"
    default: return ""
    }
}

extension UIImage {
    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
}
