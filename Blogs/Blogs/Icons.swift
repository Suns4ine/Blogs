//
//  Icons.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

enum Icons {
    case heartFill
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
    case .heartFill: return "heart-fill"
    default: return ""
    }
}

func returnIconColor(icon: Icons, size: sizeIcon) -> UIColor {
    guard !choiceIcon(icon: icon).isEmpty else { return UIColor.clear }
    
    switch (icon, size) {
    case (.facebook, _): return StandartColors.facebookColor
    case (.twitter, _): return StandartColors.twitterColor
    case (_, .big): return .clear
    case(.heartFill, _): return StandartColors.filledHeartColor
    default: return StandartColors.smallIconColor
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
