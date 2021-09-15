//
//  LanguagesApplication.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

enum LanguagesApplication: String {
    case ru
    case en
}

private (set) var LanguagesApplicationDictionary: [LanguagesApplication: String] = [
                                                                        .ru : "Русский",
                                                                        .en : "Ангийский"]

protocol LanguagesApplicationProtocol {
    
    //MARK: Start Screen
    static var titleStartScreen: String { get }
    static var textStartScreen: String { get }
    static var mailButtonStartScreen: String { get }
    static var facebookButtonStartScreen: String { get }
    static var twitterButtonStartScreen: String { get }
    
    //MARK: Login Screen
    static var headerTitleLoginScreen: String { get }
    static var titleLoginScreen: String { get }
    static var signInButtonLoginScreen: String { get }
    static var signUpButtonLoginScreen: String { get }
    static var loginTextFieldNameLoginScreen: String { get }
    static var loginTextFieldShadowTextLoginScreen: String { get }
    static var loginTextFieldErrorLoginScreen: String { get }
    static var passwordTextFieldNameLoginScreen: String { get }
    static var passwordTextFieldShadowTextLoginScreen: String { get }
    static var passwordTextFieldErrorLoginScreen: String { get }

    //MARK: Sign Up Screen
    static var headerTitleSignUpScreen: String { get }
    static var titleSignUpScreen: String { get }
    static var textSignUpScreen: String { get }
    static var registerButtonSignUpScreen: String { get }
    static var tagnameTextFieldNameSignUpScreen: String { get }
    static var tagnameTextFieldShadowTextSignUpScreen: String { get }
    static var tagnameTextFieldErrorSignUpScreen: String { get }
    static var mailTextFieldNameSignUpScreen: String { get }
    static var mailTextFieldShadowTextSignUpScreen: String { get }
    static var mailTextFieldErrorSignUpScreen: String { get }
    static var passwordTextFieldNameSignUpScreen: String { get }
    static var passwordTextFieldShadowTextSignUpScreen: String { get }
    static var passwordTextFieldErrorSignUpScreen: String { get }
    
    //MARK: Home Screen
    static var headerTitleHomeScreen: String { get }
    static var emptyArrayTitleHomeScreen: String { get }
    
    //MARK: Search Screen
    static var headerTitleSearchScreen: String { get }
    static var emptyArrayTitleSearchScreen: String { get }
    static var searchTextFieldShadowTextSearchScreen: String { get }
    
    //MARK: Saved Screen
    static var headerTitleSavedScreen: String { get }
    static var emptyArrayTitleSavedScreen: String { get }
    
    //MARK: My Profile Screen
    static var headerTitleMyProfileScreen: String { get }
    static var nameTitleMyProfileScreen: String { get }
    static var nameTagSubtitleMyProfileScreen: String { get }
    static var editButtonMyProfileScreen: String { get }
    static var aboutMeSubTitleMyProfileScreen: String { get }
    static var aboutMeTextMyProfileScreen: String { get }
    static var myBlogsSubTitleMyProfileScreen: String { get }
    static var createBlogButtonMyProfileScreen: String { get }
    static var moreBlogButtonMyProfileScreen: String { get }
    static var numberBlogTitleMyProfileScreen: String { get }
    static var followersBlogTitleMyProfileScreen: String { get }
    static var follovingBlogTitleMyProfileScreen: String { get }
    static var numberBlogNameTitleMyProfileScreen: String { get }
    static var followersBlogNameTitleMyProfileScreen: String { get }
    static var follovingBlogNameTitleMyProfileScreen: String { get }
    
    //MARK: Another Profile Screen
    static var headerTitleAnotherProfileScreen: String { get }
    static var nameTitleAnotherProfileScreen: String { get }
    static var nameTagSubtitleAnotherProfileScreen: String { get }
    static var followButtonAnotherProfileScreen: String { get }
    static var statusOnFollowButtonAnotherProfileScreen: String { get }
    static var statusOffFollowButtonAnotherProfileScreen: String { get }
    static var aboutAnotherSubTitleAnotherProfileScreen: String { get }
    static var aboutAnotherTextAnotherProfileScreen: String { get }
    static var anotherBlogsSubTitleAnotherProfileScreen: String { get }
    static var emptyTitleAnotherProfileScreen: String { get }
    static var moreBlogButtonAnotherProfileScreen: String { get }
    static var numberBlogTitleAnotherProfileScreen: String { get }
    static var followersBlogTitleAnotherProfileScreen: String { get }
    static var follovingBlogTitleAnotherProfileScreen: String { get }
    static var numberBlogNameTitleAnotherProfileScreen: String { get }
    static var followersBlogNameTitleAnotherProfileScreen: String { get }
    static var follovingBlogNameTitleAnotherProfileScreen: String { get }
    
    //MARK: Choice Language Screen
    static var headerTitleChoiceLanguageScreen: String { get }
    static var emptyArrayTitleChoiceLanguageScreen: String { get }
    
    //MARK: Choice Color Screen
    static var headerTitleChoiceColorScreen: String { get }
    static var emptyArrayTitleChoiceColorScreen: String { get }
    
    //MARK: Password Change Screen
    static var headerTitlePasswordChangeScreen: String { get }
    static var oldPasswordTextfieldNamePasswordChangeScreen: String { get }
    static var oldPasswordTextfieldShadowTextPasswordChangeScreen: String { get }
    static var oldPasswordTextfieldErrorPasswordChangeScreen: String { get }
    static var newPasswordTextfieldNamePasswordChangeScreen: String { get }
    static var newPasswordTextfieldShadowTextPasswordChangeScreen: String { get }
    static var newPasswordTextfieldErrorPasswordChangeScreen: String { get }
    static var repeatPasswordTextfieldNamePasswordChangeScreen: String { get }
    static var repeatPasswordTextfieldShadowTextPasswordChangeScreen: String { get }
    static var repeatPasswordTextfieldErrorPasswordChangeScreen: String { get }
    static var saveButtonPasswordChangeScreen: String { get }
    
    //MARK: Help Screen
    static var headerTitleHelpScreen: String { get }
    static var textHelpScreen: String { get }
    static var emptyArrayTitleHelpScreen: String { get }
    
    //MARK: About The Application Screen
    static var headerTitleAboutTheApplicationScreen: String { get }
    static var textAboutTheApplicationScreen: String { get }
    static var emptyArrayTitleAboutTheApplicationScreen: String { get }
    
    //MARK: Draft Blogs Screen
    static var headerTitleDraftBlogsScreen: String { get }
    static var emptyArrayTitleDraftBlogsScreen: String { get }
    
    //MARK: Edit Profile Screen
    static var headerTitleEditProfileScreen: String { get }
    static var editAvatarButtonEditProfileScreen: String { get }
    static var nameTextfieldNameEditProfileScreen: String { get }
    static var nameTextfieldShadowTextEditProfileScreen: String { get }
    static var nameTextfieldErrorEditProfileScreen: String { get }
    static var surnameTextfieldNameEditProfileScreen: String { get }
    static var surnameTextfieldShadowTextEditProfileScreen: String { get }
    static var surnameTextfieldErrorEditProfileScreen: String { get }
    static var tagNameTextfieldNameEditProfileScreen: String { get }
    static var tagNameTextfieldShadowTextEditProfileScreen: String { get }
    static var tagNameTextfieldErrorEditProfileScreen: String { get }
    static var aboutMeTextEditProfileScreen: String { get }
    static var aboutMeSubTitleEditProfileScreen: String { get }
    static var aboutMeErrorSubTitleEditProfileScreen: String { get }
    static var saveButtonEditProfileScreen: String { get }
    
    //MARK: Addition Blog Screen
    static var headerTitleAdditionBlogScreen: String { get }
    static var nextButtonAdditionBlogScreen: String { get }
    static var blogTitleSubTitleAdditionBlogScreen: String { get }
    static var tagSubTitleAdditionBlogScreen: String { get }
    static var blogTitleErrorSubTitleAdditionBlogScreen: String { get }
    static var tagErrorSubTitleAdditionBlogScreen: String { get }
    static var blogTitleTextAdditionBlogScreen: String { get }
    static var tagTextAdditionBlogScreen: String { get }

    //MARK: My Blog Screen
    static var headerTitlteMyBlogScreen: String { get }
    static var titleBlogMyBlogScreen: String { get }
    static var textMyBlogScreen: String { get }
    static var tagSubtitleMyBlogScreen: String { get }
    static var tagTextMyBlogScreen: String { get }
    static var editButtonMyBlogScreen: String { get }
    static var nameSubTitleMyBlogScreen: String { get }
    static var dateSubTitleMyBlogScreen: String { get }
    static var shareSubtitleMyBlogScreen: String { get }
    static var likeSubtitleMyBlogScreen: String { get }
    
    //MARK: Another Blog Screen
    static var headerTitleAnotherBlogScreen: String { get }
    static var titleBlogAnotherBlogScreen: String { get }
    static var textAnotherBlogScreen: String { get }
    static var tagSubtitleAnotherBlogScreen: String { get }
    static var tagTextAnotherBlogScreen: String { get }
    static var followButtonAnotherBlogScreen: String { get }
    static var nameSubTitleAnotherBlogScreen: String { get }
    static var dateSubTitleAnotherBlogScreen: String { get }
    static var shareSubtitleAnotherBlogScreen: String { get }
    static var likeSubtitleAnotherBlogScreen: String { get }

    //MARK: Create Blog Screen
    static var headerTitleCreateBlogScreen: String { get }
    static var nextButtonCreateBlogScreen: String { get }
    static var draftButtonCreateBlogScreen: String { get }
    static var textCreateBlogScreen: String { get }

    //MARK: Setting Screen
    static var headerTitleSettingScreen: String { get }
    
    //MARK: My More Blogs Screen
    static var headerTitleMyMoreBlogsScreen: String { get }
    static var emptyArrayTitleMyMoreBlogsScreen: String { get }

    //MARK: Another More Blogs Screen
    static var headerTitleAnotherMoreBlogsScreen: String { get }
    static var emptyArrayTitleAnotherMoreBlogsScreen: String { get }
    static var refreshControlAnotherMoreBlogsScreen: String { get }

    //MARK: Preview Screen
    static var leadingTwoButtonsPreviewScreen: String { get }
    static var tralingTwoButtonsPreviewScreen: String { get }
    static var startedButtonPreviewScreen: String { get }
    
    //MARK: Page Screen
    static var titlePageScreen: String { get }
    static var subtitlePageScreen: String { get }

    //MARK: Tab Bar Screen
    static var homeTabBar: String { get }
    static var searchTabBar: String { get }
    static var savedTabBar: String { get }
    static var profileTabBar: String { get }
    
    //MARK: Blog Cell
    static var titleBlogCell: String { get }
    static var dateSubTitleBlogCell: String { get }
    static var nameSubTitleBlogCell: String { get }
    static var tagSubTitleBlogCell: String { get }

    //MARK: Standart Blog Cell
    static var titleStandartBlogCell: String { get }
    static var nameSubTitleStandartBlogCell: String { get }
    static var dateSubTitleStandartBlogCell: String { get }
    static var deleteActionStandartBlogCell: String { get }
    
    //MARK: Setting Cell
    static var titleSettingCell: String { get }
    static var subtitleSettingCell: String { get }
    static var buttonSettingCell: String { get }
    static var togleButtonSettingCell: String { get }

    //MARK: Choice Cell
    static var titleChoiceCell: String { get }
}
