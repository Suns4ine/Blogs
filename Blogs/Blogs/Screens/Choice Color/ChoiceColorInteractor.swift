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
    
    private var colorArray: [Choice] = [
        .init(title: ColorsApplicationDictonary[.light] ?? ColorsApplication.light.rawValue),
        .init(title: ColorsApplicationDictonary[.dark] ?? ColorsApplication.dark.rawValue)]
}

extension ChoiceColorInteractor: ChoiceColorInteractorInput {
    
    func getChoice(at indexPath: Int) {
        let choice = colorArray[indexPath]
        var theme = defaultUser.personalSetting.theme
        
        switch choice.title {
        case ColorsApplicationDictonary[.light]: theme = ColorsApplication.light
        case ColorsApplicationDictonary[.dark]: theme = ColorsApplication.dark
        default: theme = defaultUser.personalSetting.theme
        }
        
        defaultUser.personalSetting.theme = theme
        output?.transferTheme(theme: theme)
    }
    
    func fetchChoices() {
        output?.choicesDidRecieve(colorArray)
    }
}
