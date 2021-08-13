//
//  Icons.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

enum Icons: String {
    case alignJustify = "align-justify"
    case alignLeft = "align-left"
    case alignRight = "align-right"
    case arrowBack = "arrow-back"
    case bell = "bell"
    case bold = "bold"
    case bookmark = "bookmark"
    case calendar = "calendar"
    case camera = "camera"
    case check = "check"
    case chervonDown = "chervon-down"
    case chervonLeft = "chervon-left"
    case chervonRight = "chervon-right"
    case chervonUp = "chervon-up"
    case cloudLightning = "cloudlightning"
    case cloudRain = "cloudRain"
    case cloudSnow = "cloud-snow"
    case cloud = "cloud"
    case cross = "cross"
    case edit = "edit"
    case eye = "eye"
    case facebook = "facebook"
    case fastForward = "fast-forward"
    case heartFill = "heart-fill"
    case heart = "heart"
    case home1 = "home 1"
    case image = "image"
    case instagram = "instagram"
    case italic = "italic"
    case lock = "lock"
    case mail = "mail"
    case mapPin = "map-pin"
    case menu = "menu"
    case messageCircle = "message-circle"
    case messageSquare = "message=square"
    case mic = "mic"
    case minus = "minus"
    case moreHorizontal = "more-horizontal"
    case navigation = "navigation"
    case pause = "pause"
    case play = "play"
    case plus = "plus"
    case repeat1 = "repeat"
    case rewind = "rewind"
    case search = "search"
    case send = "send"
    case share = "share"
    case shuffle = "shuffle"
    case star = "star"
    case sun = "sun"
    case twitter = "twitter"
    case underline = "underline"
    case user = "user"
    case youtube = "youtube"
    case fill1 = "fill - icon-only-1"
    case fill2 = "fill - icon-only-2"
    case fill3 = "fill - icon-only-3"
    case outline1 = "outline - icon-only-1"
    case outline2 = "outline - icon-only-2"
    case outline3 = "outline - icon-only-3"
    case logo = "logo-mark"
    case none = ""
}

func returnIconColor(icon: Icons, size: sizeIcon) -> UIColor {
    guard !icon.rawValue.isEmpty else { return UIColor.clear }
    
    switch (icon, size) {
    case (.facebook, _): return StandartColors.facebookColor
    case (.twitter, _): return StandartColors.twitterColor
    //case (_, .size170): return .clear
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
