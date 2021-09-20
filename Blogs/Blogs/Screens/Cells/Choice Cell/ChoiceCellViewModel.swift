//
//  ChoiceCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

final class ChoiceCellViewModel: ChoiceCellIdentifiable {
    
    //MARK: Create Variable
    let title: String
    var cellIdentifier: String {
        "ChoiceTableViewCell"
    }
    
    var cellHeight: Float {
        84
    }
    
    init(choice: Choice) {
        self.title = choice.title
    }
}

final class ChoiceSectionViewModel: ChoiceSectionRowPresentable {
    var rows: [ChoiceCellIdentifiable] = []
}
