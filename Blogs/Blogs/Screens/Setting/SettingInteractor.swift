//
//  SettingInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

final class SettingInteractor {
	weak var output: SettingInteractorOutput?
    
    private var settingArray: [Setting] = [.init(condition: .toggle), .init(condition: .toggle), .init(condition: .screen),
                                           .init(condition: .screen), .init(condition: .screen), .init(condition: .screen),
                                           .init(condition: .button), .init(condition: .button)]
}

extension SettingInteractor: SettingInteractorInput {
    func getSetting(at indexPath: IndexPath) {
        output?.settingDidRecieve(settingArray[indexPath.row])
    }
    
    func fetchSettings() {
        output?.settingsDidRecieve(settingArray)
    }
    
}
