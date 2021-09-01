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
        case LanguagesApplication.eng.rawValue: language = LanguagesApplication.eng
        case LanguagesApplication.rus.rawValue: language = LanguagesApplication.rus
        default: language = defaultUser.personalSetting.language
        }
        
        defaultUser.personalSetting.language = language
    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(languageArray)
    }
}
