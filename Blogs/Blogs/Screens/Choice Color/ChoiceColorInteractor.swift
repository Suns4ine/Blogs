//
//  ChoiceColorInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class ChoiceColorInteractor {
	weak var output: ChoiceColorInteractorOutput?
    
    private var colorArray: [Choice] = [.init(), .init(), .init(), .init(), .init()]
}

extension ChoiceColorInteractor: ChoiceColorInteractorInput {
    
    func getChoice(at indexPath: Int) {
        let Choice = colorArray[indexPath]
        
        output?.choiceDidRecieve(Choice)
    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(colorArray)
    }
}
