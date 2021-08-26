//
//  ChoiceCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation
import UIKit

final class ChoiceCellViewModel: ChoiceCellIdentifiable {
    
    let title: String
    
    var cellIdentifier: String {
        "ChoiceTableViewCell"
    }
    
    var cellHeight: CGFloat {
        84
    }
    
    init(choice: Choice) {
        self.title = choice.title
    }
}

final class ChoiceSectionViewModel: ChoiceSectionRowPresentable {
    var rows: [ChoiceCellIdentifiable] = []
    
}
