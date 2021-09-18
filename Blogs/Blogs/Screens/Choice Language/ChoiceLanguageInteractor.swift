//
//  ChoiceLanguageInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class ChoiceLanguageInteractor {
	weak var output: ChoiceLanguageInteractorOutput?
    
    private var languageArray: [Choice] = [
        .init(title: LanguagesApplicationDictionary[.en] ?? LanguagesApplication.en.rawValue),
        .init(title: LanguagesApplicationDictionary[.ru] ?? LanguagesApplication.ru.rawValue)]
}

extension ChoiceLanguageInteractor: ChoiceLanguageInteractorInput {
    
    func getChoice(at indexPath: Int) {
        let choice = languageArray[indexPath]
        var language = defaultUser.personalSetting.language
        
        switch choice.title {
        case LanguagesApplicationDictionary[.en]:
            language = LanguagesApplication.en
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LANGUAGE_WILL_CHANGE"),
                                            object: LanguagesApplication.en.rawValue)
            
        case LanguagesApplicationDictionary[.ru]:
            language = LanguagesApplication.ru
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LANGUAGE_WILL_CHANGE"),
                                            object: LanguagesApplication.ru.rawValue)
           
        default: language = defaultUser.personalSetting.language
        }
        
        defaultUser.personalSetting.language = language
        output?.callAlertNotifiaction()

    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(languageArray)
    }
}
