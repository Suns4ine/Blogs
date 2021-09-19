//
//  PageViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 02.09.2021.
//

import Foundation

final class PageViewModel: PageIdentifiable {
    
    //MARK: Create Variable
    let numb: Int
    let title: String
    let subtitle: String
    
    init(page: Page) {
        numb = page.numb
        title = page.title
        subtitle = page.subtitle
    }
}

final class PageSectionViewModel: PageSectionRowPresentable {
    var rows: [PageIdentifiable] = []
}
