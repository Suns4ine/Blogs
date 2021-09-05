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
    
    private var settingArray: [Setting] = defaultSetting
}

extension SettingInteractor: SettingInteractorInput {
    func settingButtonCell(at indexPath: IndexPath) {
        
        let setting = settingArray[indexPath.row]
        
        guard setting.condition == .button else { return }
        
        switch setting.identifier {
        case "ClearCache": defaultUser.personalSetting.cache = "Clear Cache"
        case "LogOut": output?.openStart()
        default: break
        }
    }
    
    func toggleButtonCell(_ cortage: (IndexPath, Bool)) {
        
        let index = cortage.0
        let flag = cortage.1
        
        let setting = settingArray[index.row]
        
        guard setting.condition == .toggle else { return }
        

        debugPrint("Tap Toggle")
    }
    
    func getSetting(at indexPath: IndexPath) {
        let setting = settingArray[indexPath.row]
        
        guard setting.condition == .screen else { return }
        
        
        switch setting.identifier {
        case "Color": output?.openChoiceColor(setting)
        case "Language": output?.openChoiceLanguage(setting)
        case "Password": output?.openPasswordChange(setting)
        case "Help": output?.openHelp(setting)
        case "AboutTheApplication": output?.openAboutTheApplication(setting)
        default: break
        }
    }
    
    func fetchSettings() {
        output?.settingsDidRecieve(settingArray)
    }
    
}
