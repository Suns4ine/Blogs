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
    
    private var languageArray: [Choice] = [.init(title: LanguagesApplication.rus.rawValue),
                                           .init(title: LanguagesApplication.eng.rawValue)]
}

//MARK: Удалить дефелтного юзера
extension ChoiceLanguageInteractor: ChoiceLanguageInteractorInput {
    
    func getChoice(at indexPath: Int) {
        let choice = languageArray[indexPath]
        var language = defaultUser.personalSetting.language
        
        switch choice.title {
        case LanguagesApplication.eng.rawValue:
            language = LanguagesApplication.eng
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LANGUAGE_WILL_CHANGE"), object: "en")
            
        case LanguagesApplication.rus.rawValue:
            language = LanguagesApplication.rus
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LANGUAGE_WILL_CHANGE"), object: "ru")
           
        default: language = defaultUser.personalSetting.language
        }
        
        defaultUser.personalSetting.language = language
        
        
        output?.callAlertNotifiaction()

    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(languageArray)
    }
}
