//
//  ColorsApplication.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

enum ColorsApplication: String {
    case light
    case dark
    case unspecified
}

private (set) var ColorsApplicationDictonary: [ColorsApplication: String] = [ .light : "Стандартная",
                                                                .dark: "Темная"]

protocol ColorsApplicationProtocol {
    
    var titleColor: UIColor { get }
    var subTitleColor: UIColor { get }
    var textColor: UIColor { get }
    var textErrorColor: UIColor { get }
    var textForTextfieldBackgroundColor: UIColor { get }
    var enteredTextColor: UIColor { get }
    var smallIconColor: UIColor { get }
    var bigIconColor: UIColor { get }
    var shadowColor: UIColor { get }
    var borderColor: UIColor { get }
    var launchBackgorundColor: UIColor { get }
    var previewBackgroundColor: UIColor { get }
    var startBackgroundColor: UIColor { get }
    var firstLoginBackgroundColor: UIColor { get }
    var secondLoginBackgroundColor: UIColor { get }
    var standartBackgroundColor: UIColor { get }
    var settingBackgroundColor: UIColor { get }
    var myProfileColor: UIColor { get }
    var anotherProfileColor: UIColor { get }
    var blogCellColor: UIColor { get }
    var blogBackgroundColor: UIColor { get }
    var backgroundProfileColor: UIColor { get }
    var notificationColor: UIColor { get }
    var createBlogBackgroundColor: UIColor { get }
    var utilitiesBlogBackgroundColor: UIColor { get }
    var firstButtonColor: UIColor { get }
    var secondButtonColor: UIColor { get }
    var thirdButtonColor: UIColor { get }
    var logButtonColor: UIColor { get }
    var facebookColor: UIColor { get }
    var twitterColor: UIColor { get }
    var firstTextButtonColor: UIColor { get }
    var secondTextButtonColor: UIColor { get }
    var thirdTextButtonColor: UIColor { get }
    var loginTextButtonColor: UIColor { get }
    var filledHeartColor: UIColor { get }
    var emptyHeartColor: UIColor { get }
    var backgroundAvatarColor: UIColor { get }
    var tabBarBackgroundColor: UIColor { get }
    var selectedItemTintColor: UIColor { get }
    var anotherTitleColor: UIColor { get }
    var anotherSubTitleColor: UIColor { get }
    var anotherTextColor: UIColor { get }
    var settingCellBackgroundColor: UIColor { get }
    var toggleSwitchOnColor: UIColor { get }
    var toggleSwitchOffColor: UIColor { get }
    var deleteActionColor: UIColor { get }
}

extension UIColor {
    
    static let firstBlue = UIColor(hex: 0x1947E5)
    static let secondBlue = UIColor(hex: 0x8094FF)
    static let thirdBlue = UIColor(hex: 0xE9E7FC)
    
    static let firstPink = UIColor(hex: 0xFF89BB)
    static let secondPink = UIColor(hex: 0xFFC7DE)
    static let thirdPink = UIColor(hex: 0xFFF3F8)
    
    static let firstYellow = UIColor(hex: 0xFFBD12)
    static let secondYellow = UIColor(hex: 0xFFD465)
    static let thirdYellow = UIColor(hex: 0xFFF4CC)
    
    static let firstSeaWave = UIColor(hex: 0x00C6AE)
    static let secondSeaWave = UIColor(hex: 0x61E4C5)
    static let thirdSeaWave = UIColor(hex: 0xD6FCF7)
    
    static let firstSunnyRed = UIColor(hex: 0xF95A2C)
    static let secondSunnyRed = UIColor(hex: 0xFF9692)
    static let thirdSunnyRed = UIColor(hex: 0xFFE8E8)
    
    static let firstBlack = UIColor(hex: 0x18191F)
    static let secondBlack = UIColor(hex: 0x474A57)
    
    static let firstGray = UIColor(hex: 0x969BAB)
    static let secondGray = UIColor(hex: 0x9FA4B4)
    
    static let firstWhite = UIColor(hex: 0xEEEFF4)
    static let secondWhite = UIColor(hex: 0xF4F5F7)
    static let thirdWhite = UIColor(hex: 0xFFFFFF)
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension CGColor {
    
    class func colorWithHex(hex: Int) -> CGColor {

        return UIColor(hex: hex).cgColor

    }
}
