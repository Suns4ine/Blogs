//
//  UtiliesIcon.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation
import UIKit

enum Utility {
    case image
    case bold
    case italic
    case underline
    case alignJustify
    case alignLeft
    case alignRight
    case none
}

func returnUtilityIcon(utility: Utility) -> Icons {
    switch utility {
    case .image: return Icons.image
    case .bold: return Icons.bold
    case .italic: return Icons.italic
    case .underline: return Icons.underline
    case .alignJustify: return Icons.alignJustify
    case .alignLeft: return Icons.alignLeft
    case .alignRight: return Icons.alignRight
    default: return Icons.none
    }
}
