//
//  StandartColors.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

final class StandartColors {
    
    static var titleColor: UIColor = UIColor(named: "titleColor") ?? .firstBlack
    
    static var subTitleColor: UIColor = UIColor(named: "subTitleColor") ?? .firstBlack
    
    static var textColor: UIColor = UIColor(named: "textColor") ??  .secondBlack
    
    static var textErrorColor: UIColor = UIColor(named: "textErrorColor") ?? .firstSunnyRed
    
    static var textForTextfieldBackgroundColor: UIColor = UIColor(named: "textForTextfieldBackgroundColor") ?? .firstBlack
    
    static var enteredTextColor: UIColor = UIColor(named: "enteredTextColor") ?? .firstBlack
    
    static var smallIconColor: UIColor = UIColor(named: "smallIconColor") ?? .firstBlack
    
    static var bigIconColor: UIColor = UIColor(named: "bigIconColor") ?? .firstBlack
    
    static var shadowColor: UIColor = UIColor(named: "shadowColor") ?? .firstBlack
    
    static var borderColor: UIColor = UIColor(named: "borderColor") ?? .firstBlack
    
    static var launchBackgorundColor: UIColor = UIColor(named: "launchBackgorundColor") ?? .firstBlue
    
    static var previewBackgroundColor: UIColor = UIColor(named: "previewBackgroundColor") ?? .firstBlue
    
    static var startBackgroundColor: UIColor = UIColor(named: "startBackgroundColor") ?? .firstYellow
    
    static var firstLoginBackgroundColor: UIColor = UIColor(named: "firstLoginBackgroundColor") ?? .thirdWhite
    
    static var secondLoginBackgroundColor: UIColor = UIColor(named: "secondLoginBackgroundColor") ?? .thirdWhite
    
    static var standartBackgroundColor: UIColor = UIColor(named: "standartBackgroundColor") ?? .thirdWhite
    
    static var settingBackgroundColor: UIColor = UIColor(named: "settingBackgroundColor") ?? .thirdWhite
    
    static var myProfileColor: UIColor = UIColor(named: "myProfileColor") ?? .firstBlue
    
    static var anotherProfileColor: UIColor = UIColor(named: "anotherProfileColor") ?? .firstSunnyRed
    
    static var blogCellColor: UIColor = UIColor(named: "blogCellColor") ?? .secondSeaWave
    
    static var blogBackgroundColor: UIColor = UIColor(named: "blogBackgroundColor") ?? .thirdWhite
    
    static var backgroundProfileColor: UIColor = UIColor(named: "backgroundProfileColor") ?? .thirdWhite
    
    static var notificationColor: UIColor = UIColor(named: "notificationColor") ?? .firstSunnyRed
    
    static var createBlogBackgroundColor: UIColor = UIColor(named: "createBlogBackgroundColor") ?? .thirdSunnyRed
    
    static var utilitiesBlogBackgroundColor: UIColor = UIColor(named: "utilitiesBlogBackgroundColor") ?? .secondYellow
    
    static var firstButtonColor: UIColor = UIColor(named: "firstButtonColor") ?? .firstYellow
    
    static var secondButtonColor: UIColor = UIColor(named: "secondButtonColor") ?? .firstBlack
    
    static var thirdButtonColor: UIColor = UIColor(named: "thirdButtonColor") ?? .firstWhite
    
    static var logButtonColor: UIColor = UIColor(named: "logButtonColor") ?? .firstBlack
    
    static var facebookColor: UIColor = UIColor(named: "facebookColor") ?? .firstBlue
    
    static var twitterColor: UIColor = UIColor(named: "twitterColor") ?? .firstSeaWave
    
    static var firstTextButtonColor: UIColor = UIColor(named: "firstTextButtonColor") ?? .firstBlack
    
    static var secondTextButtonColor: UIColor = UIColor(named: "secondTextButtonColor") ?? .thirdWhite
    
    static var thirdTextButtonColor: UIColor = UIColor(named: "thirdTextButtonColor") ?? .firstBlack
    
    static var loginTextButtonColor: UIColor = UIColor(named: "loginTextButtonColor") ?? .thirdWhite
    
    static var filledHeartColor: UIColor = UIColor(named: "filledHeartColor") ?? .firstSunnyRed
    
    static var emptyHeartColor: UIColor = UIColor(named: "emptyHeartColor") ?? .firstBlack
    
    static var backgroundAvatarColor: UIColor = UIColor(named: "backgroundAvatarColor") ?? .firstYellow
    
    static var tabBarBackgroundColor: UIColor = UIColor(named: "tabBarBackgroundColor") ?? .thirdWhite
    
    static var selectedItemTintColor: UIColor = UIColor(named: "selectedItemTintColor") ?? .firstBlue
    
    static var anotherTitleColor: UIColor = UIColor(named: "anotherTitleColor") ?? .secondWhite
    
    static var anotherSubTitleColor: UIColor = UIColor(named: "anotherSubTitleColor") ?? .secondWhite
    
    static var anotherTextColor: UIColor = UIColor(named: "anotherTextColor") ?? .secondWhite
    
    static var settingCellBackgroundColor: UIColor = UIColor(named: "settingCellBackgroundColor") ?? .thirdWhite
    
    static var toggleSwitchOnColor: UIColor = UIColor(named: "toggleSwitchOnColor") ?? .secondYellow
    
    static var toggleSwitchOffColor: UIColor = UIColor(named: "toggleSwitchOffColor") ?? .thirdBlue
    
    static var deleteActionColor: UIColor = UIColor(named: "deleteActionColor") ?? .firstSunnyRed
    
    static var highlightTextColor: UIColor = UIColor(named: "highlightTextColor") ?? .firstBlack
    
    static var circleToggleColor: UIColor = UIColor(named: "circleToggleColor") ?? .thirdWhite
    
    static func editColor(theme: ColorsApplication) {
        
        switch theme {
        case .standart: newTheme(theme: WhiteThemeColors() as ColorsApplicationProtocol)
        case .darkTheme: newTheme(theme: DarkThemeColors() as ColorsApplicationProtocol)
        default: break
        }
        
    }
    
    private static func newTheme(theme: ColorsApplicationProtocol) {
        
        StandartColors.titleColor = theme.titleColor
        
        StandartColors.subTitleColor = theme.subTitleColor
        
        StandartColors.textColor =  theme.textColor
        
        StandartColors.textErrorColor = theme.textErrorColor
        
        StandartColors.textForTextfieldBackgroundColor = theme.textForTextfieldBackgroundColor
        
        StandartColors.enteredTextColor = theme.enteredTextColor
        
        StandartColors.smallIconColor = theme.smallIconColor
        
        StandartColors.bigIconColor = theme.bigIconColor
        
        StandartColors.shadowColor = theme.shadowColor
        
        StandartColors.borderColor = theme.borderColor
        
        StandartColors.launchBackgorundColor = theme.launchBackgorundColor
        
        StandartColors.previewBackgroundColor = theme.previewBackgroundColor
        
        StandartColors.startBackgroundColor = theme.startBackgroundColor
        
        StandartColors.firstLoginBackgroundColor = theme.firstLoginBackgroundColor
        
        StandartColors.secondLoginBackgroundColor = theme.secondLoginBackgroundColor
        
        StandartColors.standartBackgroundColor = theme.standartBackgroundColor
        
        StandartColors.settingBackgroundColor = theme.settingBackgroundColor
        
        StandartColors.myProfileColor = theme.myProfileColor
        
        StandartColors.anotherProfileColor = theme.anotherProfileColor
        
        StandartColors.blogCellColor = theme.blogCellColor
        
        StandartColors.blogBackgroundColor = theme.blogBackgroundColor
        
        StandartColors.backgroundProfileColor = theme.backgroundProfileColor
        
        StandartColors.notificationColor = theme.notificationColor
        
        StandartColors.createBlogBackgroundColor = theme.createBlogBackgroundColor
        
        StandartColors.utilitiesBlogBackgroundColor = theme.utilitiesBlogBackgroundColor
        
        StandartColors.firstButtonColor = theme.firstButtonColor
        
        StandartColors.secondButtonColor = theme.secondButtonColor
        
        StandartColors.thirdButtonColor = theme.thirdButtonColor
        
        StandartColors.logButtonColor = theme.logButtonColor
        
        StandartColors.facebookColor = theme.facebookColor
        
        StandartColors.twitterColor = theme.twitterColor
        
        StandartColors.firstTextButtonColor = theme.firstTextButtonColor
        
        StandartColors.secondTextButtonColor = theme.secondTextButtonColor
        
        StandartColors.thirdTextButtonColor = theme.thirdTextButtonColor
        
        StandartColors.loginTextButtonColor = theme.loginTextButtonColor
        
        StandartColors.filledHeartColor = theme.filledHeartColor
        
        StandartColors.emptyHeartColor = theme.emptyHeartColor
        
        StandartColors.backgroundAvatarColor = theme.backgroundAvatarColor
        
        StandartColors.tabBarBackgroundColor = theme.tabBarBackgroundColor
        
        StandartColors.selectedItemTintColor = theme.selectedItemTintColor
        
        StandartColors.anotherTitleColor = theme.anotherTitleColor
        
        StandartColors.anotherSubTitleColor = theme.anotherSubTitleColor
        
        StandartColors.anotherTextColor =  theme.anotherTextColor
        
        StandartColors.settingCellBackgroundColor =  theme.settingCellBackgroundColor
        
        StandartColors.toggleSwitchOnColor = theme.toggleSwitchOnColor
        
        StandartColors.toggleSwitchOffColor = theme.toggleSwitchOffColor
        
        StandartColors.deleteActionColor  = theme.deleteActionColor
    }
}
