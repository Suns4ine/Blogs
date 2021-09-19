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

private (set) var ColorsApplicationDictonary: [ColorsApplication: String] = [
    .light : StandartLanguage.lightColorsApplicationDictonary,
    .dark: StandartLanguage.darkColorsApplicationDictonary
]

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
