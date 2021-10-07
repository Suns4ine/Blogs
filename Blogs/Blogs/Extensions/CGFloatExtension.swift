//
//  CGFloatExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 07.10.2021.
//

import Foundation
import UIKit

extension CGFloat {
    //MARK: Standart Constant
    static let heightScreen = UIScreen.main.bounds.height
    static let standartCornerRadiusConstant: CGFloat = 16
    
    static let subTitleHeight28Constant: CGFloat = 28
    static let subTitleHeight20Constant: CGFloat = 20
    static let subTitleHeight16Constant: CGFloat = 16
    static let borderConstant: CGFloat = 2
    
    static let standartIdentConstant: CGFloat = 24
    static let minimumIdentConstant: CGFloat = 5
    static let shadowIdentConstant: CGFloat = 4
    
    static let textHorizontalConstant: CGFloat = 16
    static let textVerticalConstant: CGFloat = 14
    static let textHeightConstant: CGFloat = 168
    
    //MARK: View Constant
    static let headerHeightConstant: CGFloat = 74
    static let textFieldHeightConstant: CGFloat = 106
    
    static let buttonBigHeightConstant: CGFloat = 60
    static let buttonSmallHeightConstant: CGFloat = 36
    static let toggleButtonHeightConstant: CGFloat = 36
    static let toggleButtonWidthConstant: CGFloat = 60
    
    //MARK: Screen Constant
    static let heightUtilietsViewConstant: CGFloat = 56
    static let emptyArrayTitleTopConstant: CGFloat = 44
    
    static let smallCircleHeightConstant: CGFloat = 12
    static let circlePreviewIdentConstant: CGFloat = 66
    static let searchBarHeightConstant: CGFloat = 56
    
    static let statisticViewProfileHeightConstant: CGFloat = 60
    static let nameTitleProfileHeightConstant: CGFloat = 44
    static let loginViewIdentConstant: CGFloat = UIScreen.main.bounds.height * 0.148
    
    //MARK: Cell Constant
    static let titleBlogCellIdentConstant: CGFloat = 108
    static let titlePageTopIdentConstant: CGFloat = Bool.isSmallScreen ? heightScreen/1.77 : heightScreen/1.93
    static let titlePageHeightIdentConstant: CGFloat = Bool.isSmallScreen ? 60 : 88
}
