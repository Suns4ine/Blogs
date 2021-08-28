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
    
    private var languageArray: [Choice] = [.init(), .init(), .init(), .init(), .init(),.init(),
                                           .init(), .init(), .init(), .init(), .init(),.init(),
                                           .init(), .init(), .init(), .init(), .init(),.init(),]
}

extension ChoiceLanguageInteractor: ChoiceLanguageInteractorInput {
    
    func getChoice(at indexPath: Int) {
        let Choice = languageArray[indexPath]
        
        output?.choiceDidRecieve(Choice)
    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(languageArray)
    }
}
