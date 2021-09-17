//
//  StringExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.09.2021.
//

import Foundation
import UIKit

extension String {
    
    static let namesArray = ["Бран", "Кейтилин", "Дейнерис", "Эддард", "Джон", "Арья", "Тирион", "Санса", "Теон",
                                     "Давос", "Сэмвелл", "Джейме", "Серсея", "Бриенна", "Арис", "Арео", "Арианна", "Аша",
                                     "Эйрон", "Виктарион", "Квентин", "Барристан", "Джон", "Меллисандра", "Уилл", "Крессен",
                                     "Четт", "Мерретт", "Пейт", "Варамир", "Киван", "Григор", "Рамси", "Джоффри", "Маргери"]
    
    static let surnamesArray = ["Старк", "Таргариен", "Сноу", "Ланнистер", "Грейджой", "Сиворт", "Тарли", "Тарт",
                                        "Окхарт", "Хотах", "Мартелл", "Селми", "Коннингтон", "Фрей", "Клиган"]
    
    static let tagnamesArray = ["С213тарк", "Т23ргариен", "321Сноу", "Лан123нистер", "Гре123йджой", "Си132ворт",
                                "Та132рли", "Т123арт", "Окх132арт", "Хот123ах", "М123артелл", "Се123лми", "Кон213нингтон",
                                "Фр132й", "К321лиган"]
    
    static let titlesBlogArray = ["Заголовок 1", "Заголвок 2", "Заголовок 3"]
    
    static let textsBlogArray = ["Текст 1", "Текст 2", "Текст 3"]
    
    static let tagsBlogArray = ["Тег1", "Тег2", "Тег3", "Тег4"]
    
    func randomName() -> String {
        let name = String.namesArray.randomElement() ?? "Бран"
        return name
    }
    
    func randomSurname() -> String {
        let name = String.surnamesArray.randomElement() ?? "Старк"
        return name
    }
    
    func randomTagname() -> String {
        let name = String.tagnamesArray.randomElement() ?? "имя тег"
        return name
    }
    
    func randomTitleBlog() -> String {
        let name = String.titlesBlogArray.randomElement() ?? "Заголовок"
        return name
    }
    
    func randomTextBlog() -> String {
        let name = String.textsBlogArray.randomElement() ?? "текст"
        return name
    }
    
    func randomTagsBlog() -> [String] {
        var array: [String] = []
        
        for _ in 1...Int.random(in: 1...10) {
            array.append(String.tagsBlogArray.randomElement() ?? "тег")
        }
        
        return array
    }
    
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
