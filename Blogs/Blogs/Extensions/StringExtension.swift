//
//  StringExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.09.2021.
//

import Foundation

extension String {
    
    static let namesArray = ["Бран", "Кейтилин", "Дейнерис", "Эддард", "Джон", "Арья", "Тирион", "Санса", "Теон",
                                     "Давос", "Сэмвелл", "Джейме", "Серсея", "Бриенна", "Арис", "Арео", "Арианна", "Аша",
                                     "Эйрон", "Виктарион", "Квентин", "Барристан", "Джон", "Меллисандра", "Уилл", "Крессен",
                                     "Четт", "Мерретт", "Пейт", "Варамир", "Киван", "Григор", "Рамси", "Джоффри", "Маргери"]
    
    static let surnamesArray = ["Старк", "Таргариен", "Сноу", "Ланнистер", "Грейджой", "Сиворт", "Тарли", "Тарт",
                                        "Окхарт", "Хотах", "Мартелл", "Селми", "Коннингтон", "Фрей", "Клиган"]
    
    func randomName() -> String {
        let name = String.namesArray.randomElement() ?? "Бран"
        return name
    }
    
    func randomSurname() -> String {
        let name = String.surnamesArray.randomElement() ?? "Старк"
        return name
    }
    
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
