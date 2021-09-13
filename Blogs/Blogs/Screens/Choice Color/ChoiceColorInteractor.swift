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
    
    private var colorArray: [Choice] = [.init(title: ColorsApplication.standart.rawValue),
                                        .init(title: ColorsApplication.darkTheme.rawValue)]
}

extension ChoiceColorInteractor: ChoiceColorInteractorInput {
    
    func getChoice(at indexPath: Int) {
        let choice = colorArray[indexPath]
        var theme = defaultUser.personalSetting.theme
        
        switch choice.title {
        case ColorsApplication.standart.rawValue: theme = ColorsApplication.standart
        case ColorsApplication.darkTheme.rawValue: theme = ColorsApplication.darkTheme
        default: theme = defaultUser.personalSetting.theme
        }
        
        defaultUser.personalSetting.theme = theme
        
        output?.transferTheme(theme: theme)
    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(colorArray)
    }
}
