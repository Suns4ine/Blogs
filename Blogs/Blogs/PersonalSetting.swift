//
//  PersonalSetting.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 31.08.2021.
//

import Foundation

struct PersonalSetting {
    
    enum PersonalSettingsKeys: String {
        case sound
        case notification
        case language
        case theme
    }
    
    var sound: Bool {
        didSet {
            currentSetting()
        }
    }
    
    var notification: Bool {
        didSet {
            currentSetting()
        }
    }
    
    var language: LanguagesApplication
    var theme: ColorsApplication
    
    init(sound: Bool,
         notification: Bool,
         language: LanguagesApplication,
         theme: ColorsApplication) {
        self.sound = sound
        self.notification = notification
        self.language = language
        self.theme = theme
    }
    
    func currentSetting() {
        UserDefaults.standard.set(sound, forKey: PersonalSettingsKeys.sound.rawValue)
        UserDefaults.standard.set(notification, forKey: PersonalSettingsKeys.notification.rawValue)
    }
}

var showPreview = false
