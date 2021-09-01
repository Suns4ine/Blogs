//
//  Setting.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

struct Setting {
    let title: String
    let subtitle: String
    let icon: Icons = .chervonRight
    var condition: SelectSettingCell
    var identifier: String
    var flag: Bool
}

var defaultSetting: [Setting] = [.init(title: "Уведомления",
                                       subtitle: "Если не хотите получать уведомления, то просто отключите здесь",
                                       condition: .toggle,
                                       identifier: "notification",
                                       flag: false),
                                 .init(title: "Звук",
                                       subtitle: "Звук также можно отключить тут",
                                       condition: .toggle,
                                       identifier: "sound",
                                       flag: false),
                                 .init(title: "Изменить тему",
                                       subtitle: "",
                                       condition: .screen,
                                       identifier: "Color",
                                       flag: false),
                                 .init(title: "Изменить язык",
                                       subtitle: "",
                                       condition: .screen,
                                       identifier: "Language",
                                       flag: false),
                                 .init(title: "Изменить пароль",
                                       subtitle: "",
                                       condition: .screen,
                                       identifier: "Password",
                                       flag: false),
                                 .init(title: "Помощь",
                                       subtitle: "",
                                       condition: .screen,
                                       identifier: "Help",
                                       flag: false),
                                 .init(title: "Об Приложении",
                                       subtitle: "",
                                       condition: .screen,
                                       identifier: "AboutTheApplication",
                                       flag: false),
                                 .init(title: "Очистить кэш",
                                       subtitle: "",
                                       condition: .button,
                                       identifier: "ClearCache",
                                       flag: false),
                                 .init(title: "Выйти",
                                       subtitle: "",
                                       condition: .button,
                                       identifier: "LogOut",
                                       flag: false)]
