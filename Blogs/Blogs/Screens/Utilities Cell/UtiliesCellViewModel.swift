//
//  UtiliesCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation
import UIKit

final class UtiliesCellViewModel: UtiliesCellIdentifiable {
    
    let utility: Utility
    
    var cellIdentifier: String {
        "UtilitiesCollectionViewCell"
    }
    
    var cellHeight: CGFloat {
        44
    }
    
    var cellWidth: CGFloat {
       44
    }
    
    init(utility: Utility) {
        self.utility = utility
    }
    
}

final class UtiliesSectionViewModel: UtiliesSectionRowPresentable {
    var rows: [UtiliesCellIdentifiable] = []
}
