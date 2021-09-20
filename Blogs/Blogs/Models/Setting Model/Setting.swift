//
//  Setting.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

class Setting {
    
    //MARK: Create Variable
    let title: String
    let subtitle: String
    let icon: Icons = .chervonRight
    var condition: SelectSettingCell
    var identifier: String
    var flag: Bool
    
    init(title: String,
         subtitle: String,
         condition: SelectSettingCell,
         identifier: String,
         flag: Bool) {
        
        self.title = title
        self.subtitle = subtitle
        self.condition = condition
        self.identifier = identifier
        self.flag = flag
    }
}

var defaultSetting: [Setting] = [.init(title: StandartLanguage.notificationTitleSettingArray,
                                       subtitle: StandartLanguage.notificationSubtitleSettingArray,
                                       condition: .toggle,
                                       identifier: "Notification",
                                       flag: defaultUser.personalSetting.notification),
                                 .init(title: StandartLanguage.soundTitleSettingArray,
                                       subtitle: StandartLanguage.soundSubtitleSettingArray,
                                       condition: .toggle,
                                       identifier: "Sound",
                                       flag: defaultUser.personalSetting.sound),
                                 .init(title: StandartLanguage.changeThemeTitleSettingArray,
                                       subtitle: StandartLanguage.changeThemeSubtitleSettingArray,
                                       condition: .screen,
                                       identifier: "Color",
                                       flag: false),
                                 .init(title: StandartLanguage.changeLanguageTitleSettingArray,
                                       subtitle: StandartLanguage.changeLanguageSubtitleSettingArray,
                                       condition: .screen,
                                       identifier: "Language",
                                       flag: false),
                                 .init(title: StandartLanguage.changePasswordTitleSettingArray,
                                       subtitle: StandartLanguage.changePasswordSubtitleSettingArray,
                                       condition: .screen,
                                       identifier: "Password",
                                       flag: false),
                                 .init(title: StandartLanguage.helpTitleSettingArray,
                                       subtitle:StandartLanguage.helpSubtitleSettingArray,
                                       condition: .screen,
                                       identifier: "Help",
                                       flag: false),
                                 .init(title: StandartLanguage.aboutTheApplicationTitleSettingArray,
                                       subtitle: StandartLanguage.AboutTheApplicationSubtitleSettingArray,
                                       condition: .screen,
                                       identifier: "AboutTheApplication",
                                       flag: false),
                                 .init(title: StandartLanguage.clearCacheTitleSettingArray,
                                       subtitle: StandartLanguage.ClearCacheSubtitleSettingArray,
                                       condition: .button,
                                       identifier: "ClearCache",
                                       flag: false),
                                 .init(title: StandartLanguage.logOutTitleSettingArray,
                                       subtitle: StandartLanguage.LogOutSubtitleSettingArray,
                                       condition: .button,
                                       identifier: "LogOut",
                                       flag: false)]
