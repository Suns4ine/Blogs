//
//  UtiliesCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

final class UtiliesCellViewModel: UtiliesCellIdentifiable {
    
    //MARK: Create Variable
    let utility: Utility
    var cellIdentifier: String {
        "UtilitiesCollectionViewCell"
    }
    
    var cellHeight: Float {
        44
    }
    
    var cellWidth: Float {
       44
    }

    init(utility: Utility) {
        self.utility = utility
    }
}

final class UtiliesSectionViewModel: UtiliesSectionRowPresentable {
    var rows: [UtiliesCellIdentifiable] = []
    
    var minimumLineSpacing: Float {
        4
    }
}
