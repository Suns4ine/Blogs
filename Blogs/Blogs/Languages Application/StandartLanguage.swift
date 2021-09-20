//
//  StandartLanguage.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.08.2021.
//

import Foundation

final class StandartLanguage: LanguagesApplicationProtocol {
    
    //MARK: Start Screen
    static var titleStartScreen: String = NSLocalizedString("titleStartScreen", comment: "")
    static var textStartScreen: String = NSLocalizedString("textStartScreen", comment: "")
    static var mailButtonStartScreen: String = NSLocalizedString("mailButtonStartScreen", comment: "")
    static var facebookButtonStartScreen: String = NSLocalizedString("facebookButtonStartScreen", comment: "")
    static var twitterButtonStartScreen: String = NSLocalizedString("twitterButtonStartScreen", comment: "")
    
    //MARK: Login Screen
    static var headerTitleLoginScreen: String = NSLocalizedString("headerTitleLoginScreen", comment: "")
    static var titleLoginScreen: String = NSLocalizedString("titleLoginScreen", comment: "")
    static var signInButtonLoginScreen: String = NSLocalizedString("signInButtonLoginScreen", comment: "")
    static var signUpButtonLoginScreen: String = NSLocalizedString("signUpButtonLoginScreen", comment: "")
    static var loginTextFieldNameLoginScreen: String = NSLocalizedString("loginTextFieldNameLoginScreen", comment: "")
    static var loginTextFieldShadowTextLoginScreen: String = NSLocalizedString("loginTextFieldShadowTextLoginScreen",
                                                                               comment: "")
    static var loginTextFieldErrorLoginScreen: String = NSLocalizedString("loginTextFieldErrorLoginScreen", comment: "")
    static var passwordTextFieldNameLoginScreen: String = NSLocalizedString("passwordTextFieldNameLoginScreen", comment: "")
    static var passwordTextFieldShadowTextLoginScreen: String = NSLocalizedString("passwordTextFieldShadowTextLoginScreen",
                                                                                  comment: "")
    static var passwordTextFieldErrorLoginScreen: String = NSLocalizedString("passwordTextFieldErrorLoginScreen",
                                                                             comment: "")
    
    static var errorLoginIsEmptyLoginScreen: String = NSLocalizedString("errorLoginIsEmptyLoginScreen", comment: "")
    static var errorLoginNotCorrectLoginScreen: String = NSLocalizedString("errorLoginNotCorrectLoginScreen", comment: "")
    static var errorPasswordIsEmptyLoginScreen: String = NSLocalizedString("errorPasswordIsEmptyLoginScreen", comment: "")
    static var errorPasswordNotCorrectLoginScreen: String = NSLocalizedString("errorPasswordNotCorrectLoginScreen", comment: "")
    static var errorAuthOneLoginScreen: String = NSLocalizedString("errorAuthOneLoginScreen", comment: "")
    static var errorAuthTwoLoginScreen: String = NSLocalizedString("errorAuthTwoLoginScreen", comment: "")
    static var errorAuthThreeLoginScreen: String = NSLocalizedString("errorAuthThreeLoginScreen", comment: "")
    static var errorAuthFourLoginScreen: String = NSLocalizedString("errorAuthFourLoginScreen", comment: "")
    
    //MARK: Sign Up Screen
    static var headerTitleSignUpScreen: String = NSLocalizedString("headerTitleSignUpScreen", comment: "")
    static var titleSignUpScreen: String = NSLocalizedString("titleSignUpScreen", comment: "")
    static var textSignUpScreen: String = NSLocalizedString("textSignUpScreen", comment: "")
    static var registerButtonSignUpScreen: String = NSLocalizedString("registerButtonSignUpScreen", comment: "")
    static var tagnameTextFieldNameSignUpScreen: String = NSLocalizedString("tagnameTextFieldNameSignUpScreen", comment: "")
    static var tagnameTextFieldShadowTextSignUpScreen: String = NSLocalizedString("tagnameTextFieldShadowTextSignUpScreen",
                                                                               comment: "")
    static var tagnameTextFieldErrorSignUpScreen: String = NSLocalizedString("tagnameTextFieldErrorSignUpScreen", comment: "")
    static var mailTextFieldNameSignUpScreen: String = NSLocalizedString("mailTextFieldNameSignUpScreen", comment: "")
    static var mailTextFieldShadowTextSignUpScreen: String = NSLocalizedString("mailTextFieldShadowTextSignUpScreen",
                                                                               comment: "")
    static var mailTextFieldErrorSignUpScreen: String = NSLocalizedString("mailTextFieldErrorSignUpScreen", comment: "")
    static var passwordTextFieldNameSignUpScreen: String = NSLocalizedString("passwordTextFieldNameSignUpScreen",
                                                                             comment: "")
    static var passwordTextFieldShadowTextSignUpScreen: String = NSLocalizedString("passwordTextFieldShadowTextSignUpScreen",
                                                                                   comment: "")
    static var passwordTextFieldErrorSignUpScreen: String = NSLocalizedString("passwordTextFieldErrorSignUpScreen",
                                                                              comment: "")
    
    static var errorTagnameIsEmptySignUpScreen: String = NSLocalizedString("errorTagnameIsEmptySignUpScreen", comment: "")
    static var errorTagnameLittleSignUpScreen: String = NSLocalizedString("errorTagnameLittleSignUpScreen", comment: "")
    static var errorTagnameMoreSignUpScreen: String = NSLocalizedString("errorTagnameMoreSignUpScreen", comment: "")
    static var errorMailIsEmptySignUpScreen: String = NSLocalizedString("errorMailIsEmptySignUpScreen", comment: "")
    static var errorMailNotCorrectSignUpScreen: String = NSLocalizedString("errorMailNotCorrectSignUpScreen", comment: "")
    static var errorPasswordIsEmptySignUpScreen: String = NSLocalizedString("errorPasswordIsEmptySignUpScreen", comment: "")
    static var errorPasswordLittleSignUpScreen: String = NSLocalizedString("errorPasswordLittleSignUpScreen", comment: "")
    static var errorPasswordMoreSignUpScreen: String = NSLocalizedString("errorPasswordMoreSignUpScreen", comment: "")
    static var errorRegisterOneSignUpScreen: String = NSLocalizedString("errorRegisterOneSignUpScreen", comment: "")
    static var errorRegisterTwoSignUpScreen: String = NSLocalizedString("errorRegisterTwoSignUpScreen", comment: "")
    static var errorRegisterThreeSignUpScreen: String = NSLocalizedString("errorRegisterThreeSignUpScreen", comment: "")
    
    //MARK: Home Screen
    static var headerTitleHomeScreen: String = NSLocalizedString("headerTitleHomeScreen", comment: "")
    static var emptyArrayTitleHomeScreen: String = NSLocalizedString("emptyArrayTitleHomeScreen", comment: "")
    
    //MARK: Search Screen
    static var headerTitleSearchScreen: String = NSLocalizedString("headerTitleSearchScreen", comment: "")
    static var emptyArrayTitleSearchScreen: String = NSLocalizedString("emptyArrayTitleSearchScreen", comment: "")
    static var searchTextFieldShadowTextSearchScreen: String = NSLocalizedString("searchTextFieldShadowTextSearchScreen",
                                                                                 comment: "")
    
    //MARK: Saved Screen
    static var headerTitleSavedScreen: String = NSLocalizedString("headerTitleSavedScreen", comment: "")
    static var emptyArrayTitleSavedScreen: String = NSLocalizedString("emptyArrayTitleSavedScreen", comment: "")
    
    //MARK: My Profile Screen
    static var headerTitleMyProfileScreen: String = NSLocalizedString("headerTitleMyProfileScreen", comment: "")
    static var nameTitleMyProfileScreen: String = NSLocalizedString("nameTitleMyProfileScreen", comment: "")
    static var nameTagSubtitleMyProfileScreen: String = NSLocalizedString("nameTagSubtitleMyProfileScreen", comment: "")
    static var editButtonMyProfileScreen: String = NSLocalizedString("editButtonMyProfileScreen", comment: "")
    static var aboutMeSubTitleMyProfileScreen: String = NSLocalizedString("aboutMeSubTitleMyProfileScreen", comment: "")
    static var aboutMeTextMyProfileScreen: String = NSLocalizedString("aboutMeTextMyProfileScreen", comment: "")
    static var myBlogsSubTitleMyProfileScreen: String = NSLocalizedString("myBlogsSubTitleMyProfileScreen", comment: "")
    static var createBlogButtonMyProfileScreen: String = NSLocalizedString("createBlogButtonMyProfileScreen", comment: "")
    static var moreBlogButtonMyProfileScreen: String = NSLocalizedString("moreBlogButtonMyProfileScreen", comment: "")
    static var numberBlogTitleMyProfileScreen: String = NSLocalizedString("numberBlogTitleMyProfileScreen", comment: "")
    static var followersBlogTitleMyProfileScreen: String = NSLocalizedString("followersBlogTitleMyProfileScreen",
                                                                             comment: "")
    static var follovingBlogTitleMyProfileScreen: String = NSLocalizedString("follovingBlogTitleMyProfileScreen",
                                                                             comment: "")
    static var numberBlogNameTitleMyProfileScreen: String = NSLocalizedString("numberBlogNameTitleMyProfileScreen",
                                                                              comment: "")
    static var followersBlogNameTitleMyProfileScreen: String = NSLocalizedString("followersBlogNameTitleMyProfileScreen",
                                                                                 comment: "")
    static var follovingBlogNameTitleMyProfileScreen: String = NSLocalizedString("follovingBlogNameTitleMyProfileScreen",
                                                                                 comment: "")
    static var aboutMeIsEmptyTextMyProfileScreen: String =
        NSLocalizedString("aboutMeIsEmptyTextMyProfileScreen", comment: "")
    
    static var alertSelectImageTitleEditProfileScreen: String =
        NSLocalizedString("alertSelectImageTitleEditProfileScreen", comment: "")
    static var alertSelectImageCameraButtonEditProfileScreen: String =
        NSLocalizedString("alertSelectImageCameraButtonEditProfileScreen",comment: "")
    static var alertSelectImageGaleryButtonEditProfileScreen: String =
        NSLocalizedString("alertSelectImageGaleryButtonEditProfileScreen", comment: "")
    static var alertSelectImageCancelButtonEditProfileScreen: String =
        NSLocalizedString("alertSelectImageCancelButtonEditProfileScreen", comment: "")
    static var alertOpenGalleryTitleEditProfileScreen: String =
        NSLocalizedString("alertOpenGalleryTitleEditProfileScreen", comment: "")
    static var alertOpenGalleryMessageEditProfileScreen: String =
        NSLocalizedString("alertOpenGalleryMessageEditProfileScreen", comment: "")
    static var alertOpenGalleryCancelButtonEditProfileScreen: String =
        NSLocalizedString("alertOpenGalleryCancelButtonEditProfileScreen", comment: "")
    static var alertOpenCameraTitleEditProfileScreen: String =
        NSLocalizedString("alertOpenCameraTitleEditProfileScreen", comment: "")
    static var alertOpenCameraMessageEditProfileScreen: String =
        NSLocalizedString("alertOpenCameraMessageEditProfileScreen", comment: "")
    static var alertOpenCameraCancelButtonEditProfileScreen: String =
        NSLocalizedString("alertOpenCameraCancelButtonEditProfileScreen", comment: "")
    static var errorNameIsEmptyEditProfileScreen: String =
        NSLocalizedString("errorNameIsEmptyEditProfileScreen", comment: "")
    static var errorNameLittleEditProfileScreen: String =
        NSLocalizedString("errorNameLittleEditProfileScreen", comment: "")
    static var errorNameMoreEditProfileScreen: String =
        NSLocalizedString("errorNameMoreEditProfileScreen", comment: "")
    static var errorSurnameIsEmptyEditProfileScreen: String =
        NSLocalizedString("errorSurnameIsEmptyEditProfileScreen", comment: "")
    static var errorSurnameLittleEditProfileScreen: String =
        NSLocalizedString("errorSurnameLittleEditProfileScreen", comment: "")
    static var errorSurnameMoreEditProfileScreen: String =
        NSLocalizedString("errorSurnameMoreEditProfileScreen", comment: "")
    static var errorTagnameIsEmptyEditProfileScreen: String =
        NSLocalizedString("errorTagnameIsEmptyEditProfileScreen", comment: "")
    static var errorTagnameLittleEditProfileScreen: String =
        NSLocalizedString("errorTagnameLittleEditProfileScreen", comment: "")
    static var errorTagnameMoreEditProfileScreen: String =
        NSLocalizedString("errorTagnameMoreEditProfileScreen", comment: "")
    static var errorAboutMeMoreEditProfileScreen: String =
        NSLocalizedString("errorAboutMeMoreEditProfileScreen", comment: "")
    
    //MARK: Another Profile Screen
    static var headerTitleAnotherProfileScreen: String = NSLocalizedString("headerTitleAnotherProfileScreen", comment: "")
    static var nameTitleAnotherProfileScreen: String = NSLocalizedString("nameTitleAnotherProfileScreen", comment: "")
    static var nameTagSubtitleAnotherProfileScreen: String = NSLocalizedString("nameTagSubtitleAnotherProfileScreen",
                                                                               comment: "")
    static var followButtonAnotherProfileScreen: String = NSLocalizedString("followButtonAnotherProfileScreen", comment: "")
    static var statusOnFollowButtonAnotherProfileScreen: String =
        NSLocalizedString("statusOnFollowButtonAnotherProfileScreen", comment: "")
    static var statusOffFollowButtonAnotherProfileScreen: String =
        NSLocalizedString("statusOffFollowButtonAnotherProfileScreen", comment: "")
    static var aboutAnotherSubTitleAnotherProfileScreen: String =
        NSLocalizedString("aboutAnotherSubTitleAnotherProfileScreen", comment: "")
    static var aboutAnotherTextAnotherProfileScreen: String = NSLocalizedString("aboutAnotherTextAnotherProfileScreen",
                                                                                comment: "")
    static var anotherBlogsSubTitleAnotherProfileScreen: String =
        NSLocalizedString("anotherBlogsSubTitleAnotherProfileScreen", comment: "")
    static var emptyTitleAnotherProfileScreen: String = NSLocalizedString("emptyTitleAnotherProfileScreen", comment: "")
    static var moreBlogButtonAnotherProfileScreen: String = NSLocalizedString("moreBlogButtonAnotherProfileScreen",
                                                                              comment: "")
    static var numberBlogTitleAnotherProfileScreen: String = NSLocalizedString("numberBlogTitleAnotherProfileScreen",
                                                                               comment: "")
    static var followersBlogTitleAnotherProfileScreen: String = NSLocalizedString("followersBlogTitleAnotherProfileScreen",
                                                                                  comment: "")
    static var follovingBlogTitleAnotherProfileScreen: String = NSLocalizedString("follovingBlogTitleAnotherProfileScreen",
                                                                                  comment: "")
    static var numberBlogNameTitleAnotherProfileScreen: String =
        NSLocalizedString("numberBlogNameTitleAnotherProfileScreen", comment: "")
    static var followersBlogNameTitleAnotherProfileScreen: String =
        NSLocalizedString("followersBlogNameTitleAnotherProfileScreen", comment: "")
    static var follovingBlogNameTitleAnotherProfileScreen: String =
        NSLocalizedString("follovingBlogNameTitleAnotherProfileScreen", comment: "")
    
    //MARK: Choice Language Screen
    static var headerTitleChoiceLanguageScreen: String = NSLocalizedString("headerTitleChoiceLanguageScreen", comment: "")
    static var emptyArrayTitleChoiceLanguageScreen: String = NSLocalizedString("emptyArrayTitleChoiceLanguageScreen", comment: "")
    static var alertNotificationTitleChoiceLanguageScreen: String =
        NSLocalizedString("alertNotificationTitleChoiceLanguageScreen", comment: "")
    static var alertNotificationMessageChoiceLanguageScreen: String =
        NSLocalizedString("alertNotificationMessageChoiceLanguageScreen", comment: "")
    static var alertNotificationCancelButtonChoiceLanguageScreen: String =
        NSLocalizedString("alertNotificationCancelButtonChoiceLanguageScreen", comment: "")
    
    //MARK: Choice Color Screen
    static var headerTitleChoiceColorScreen: String = NSLocalizedString("headerTitleChoiceColorScreen", comment: "")
    static var emptyArrayTitleChoiceColorScreen: String = NSLocalizedString("emptyArrayTitleChoiceColorScreen", comment: "")
    
    //MARK: Password Change Screen
    static var headerTitlePasswordChangeScreen: String = NSLocalizedString("headerTitlePasswordChangeScreen", comment: "")
    static var oldPasswordTextfieldNamePasswordChangeScreen: String =
        NSLocalizedString("oldPasswordTextfieldNamePasswordChangeScreen", comment: "")
    static var oldPasswordTextfieldShadowTextPasswordChangeScreen: String =
        NSLocalizedString("oldPasswordTextfieldShadowTextPasswordChangeScreen", comment: "")
    static var oldPasswordTextfieldErrorPasswordChangeScreen: String =
        NSLocalizedString("oldPasswordTextfieldErrorPasswordChangeScreen", comment: "")
    static var newPasswordTextfieldNamePasswordChangeScreen: String =
        NSLocalizedString("newPasswordTextfieldNamePasswordChangeScreen", comment: "")
    static var newPasswordTextfieldShadowTextPasswordChangeScreen: String =
        NSLocalizedString("newPasswordTextfieldShadowTextPasswordChangeScreen", comment: "")
    static var newPasswordTextfieldErrorPasswordChangeScreen: String =
        NSLocalizedString("newPasswordTextfieldErrorPasswordChangeScreen", comment: "")
    static var repeatPasswordTextfieldNamePasswordChangeScreen: String =
        NSLocalizedString("repeatPasswordTextfieldNamePasswordChangeScreen", comment: "")
    static var repeatPasswordTextfieldShadowTextPasswordChangeScreen: String =
        NSLocalizedString("repeatPasswordTextfieldShadowTextPasswordChangeScreen", comment: "")
    static var repeatPasswordTextfieldErrorPasswordChangeScreen: String =
        NSLocalizedString("repeatPasswordTextfieldErrorPasswordChangeScreen", comment: "")
    static var saveButtonPasswordChangeScreen: String = NSLocalizedString("saveButtonPasswordChangeScreen", comment: "")
    
    static var newPasswordIsEmptyPasswordChangeScreen: String =
        NSLocalizedString("newPasswordIsEmptyPasswordChangeScreen", comment: "")
    static var newPasswordLittlePasswordChangeScreen: String =
        NSLocalizedString("newPasswordLittlePasswordChangeScreen", comment: "")
    static var newPasswordEqualityPasswordChangeScreen: String =
        NSLocalizedString("newPasswordEqualityPasswordChangeScreen", comment: "")
    static var newPasswordMorePasswordChangeScreen: String =
        NSLocalizedString("newPasswordMorePasswordChangeScreen", comment: "")
    static var repeatPasswordIsEmptyPasswordChangeScreen: String =
        NSLocalizedString("repeatPasswordIsEmptyPasswordChangeScreen", comment: "")
    static var repeatPasswordNotEqualityPasswordChangeScreen: String =
        NSLocalizedString("repeatPasswordNotEqualityPasswordChangeScreen", comment: "")
    static var oldPasswordNotCorrectPasswordChangeScreen: String =
        NSLocalizedString("oldPasswordNotCorrectPasswordChangeScreen", comment: "")
    static var errorUpdatePasswordPasswordChangeScreen: String =
        NSLocalizedString("errorUpdatePasswordPasswordChangeScreen", comment: "")
    
    //MARK: Help Screen
    static var headerTitleHelpScreen: String = NSLocalizedString("headerTitleHelpScreen", comment: "")
    static var textHelpScreen: String = NSLocalizedString("textHelpScreen", comment: "")
    static var emptyArrayTitleHelpScreen: String = NSLocalizedString("emptyArrayTitleHelpScreen", comment: "")
    
    //MARK: About The Application Screen
    static var headerTitleAboutTheApplicationScreen: String = NSLocalizedString("headerTitleAboutTheApplicationScreen", comment: "")
    static var textAboutTheApplicationScreen: String = NSLocalizedString("textAboutTheApplicationScreen", comment: "")
    static var emptyArrayTitleAboutTheApplicationScreen: String = NSLocalizedString("emptyArrayTitleAboutTheApplicationScreen",
                                                                                    comment: "")

    //MARK: Draft Blogs Screen
    static var headerTitleDraftBlogsScreen: String = NSLocalizedString("headerTitleDraftBlogsScreen", comment: "")
    static var emptyArrayTitleDraftBlogsScreen: String = NSLocalizedString("emptyArrayTitleDraftBlogsScreen", comment: "")
    
    //MARK: Edit Profile Screen
    static var headerTitleEditProfileScreen: String = NSLocalizedString("headerTitleEditProfileScreen", comment: "")
    static var editAvatarButtonEditProfileScreen: String = NSLocalizedString("editAvatarButtonEditProfileScreen", comment: "")
    static var nameTextfieldNameEditProfileScreen: String = NSLocalizedString("nameTextfieldNameEditProfileScreen", comment: "")
    static var nameTextfieldShadowTextEditProfileScreen: String = NSLocalizedString("nameTextfieldShadowTextEditProfileScreen",
                                                                                    comment: "")
    static var nameTextfieldErrorEditProfileScreen: String = NSLocalizedString("nameTextfieldErrorEditProfileScreen", comment: "")
    static var surnameTextfieldNameEditProfileScreen: String = NSLocalizedString("surnameTextfieldNameEditProfileScreen",
                                                                                 comment: "")
    static var surnameTextfieldShadowTextEditProfileScreen: String =
        NSLocalizedString("surnameTextfieldShadowTextEditProfileScreen", comment: "")
    static var surnameTextfieldErrorEditProfileScreen: String = NSLocalizedString("surnameTextfieldErrorEditProfileScreen",
                                                                                  comment: "")
    static var tagNameTextfieldNameEditProfileScreen: String = NSLocalizedString("tagNameTextfieldNameEditProfileScreen",
                                                                                 comment: "")
    static var tagNameTextfieldShadowTextEditProfileScreen: String =
        NSLocalizedString("tagNameTextfieldShadowTextEditProfileScreen", comment: "")
    static var tagNameTextfieldErrorEditProfileScreen: String = NSLocalizedString("tagNameTextfieldErrorEditProfileScreen",
                                                                                  comment: "")
    static var aboutMeTextEditProfileScreen: String = NSLocalizedString("aboutMeTextEditProfileScreen", comment: "")
    static var aboutMeSubTitleEditProfileScreen: String = NSLocalizedString("aboutMeSubTitleEditProfileScreen", comment: "")
    static var aboutMeErrorSubTitleEditProfileScreen: String = NSLocalizedString("aboutMeErrorSubTitleEditProfileScreen",
                                                                                 comment: "")
    static var saveButtonEditProfileScreen: String = NSLocalizedString("saveButtonEditProfileScreen", comment: "")
    
    //MARK: Addition Blog Screen
    static var headerTitleAdditionBlogScreen: String = NSLocalizedString("headerTitleAdditionBlogScreen", comment: "")
    static var nextButtonAdditionBlogScreen: String = NSLocalizedString("nextButtonAdditionBlogScreen", comment: "")
    static var blogTitleSubTitleAdditionBlogScreen: String = NSLocalizedString("blogTitleSubTitleAdditionBlogScreen",
                                                                               comment: "")
    static var tagSubTitleAdditionBlogScreen: String = NSLocalizedString("tagSubTitleAdditionBlogScreen", comment: "")
    static var blogTitleErrorSubTitleAdditionBlogScreen: String =
        NSLocalizedString("blogTitleErrorSubTitleAdditionBlogScreen", comment: "")
    static var tagErrorSubTitleAdditionBlogScreen: String = NSLocalizedString("tagErrorSubTitleAdditionBlogScreen",
                                                                              comment: "")
    static var blogTitleTextAdditionBlogScreen: String = NSLocalizedString("blogTitleTextAdditionBlogScreen", comment: "")
    static var tagTextAdditionBlogScreen: String = NSLocalizedString("tagTextAdditionBlogScreen", comment: "")
    
    static var errorNameIsEmptyAdditionBlogScreen: String =
        NSLocalizedString("errorNameIsEmptyAdditionBlogScreen", comment: "")
    static var errorNameLittleAdditionBlogScreen: String =
        NSLocalizedString("errorNameLittleAdditionBlogScreen", comment: "")
    static var errorNameMoreAdditionBlogScreen: String =
        NSLocalizedString("errorNameMoreAdditionBlogScreen", comment: "")
    static var errorTagnameLittleAdditionBlogScreen: String =
        NSLocalizedString("errorTagnameLittleAdditionBlogScreen", comment: "")
    static var errorTagnameMoreAdditionBlogScreen: String =
        NSLocalizedString("errorTagnameMoreAdditionBlogScreen", comment: "")
    static var errorArrayTagsMoreAdditionBlogScreen: String =
        NSLocalizedString("errorArrayTagsMoreAdditionBlogScreen", comment: "")
    
    //MARK: My Blog Screen
    static var headerTitlteMyBlogScreen: String = NSLocalizedString("headerTitlteMyBlogScreen", comment: "")
    static var titleBlogMyBlogScreen: String = NSLocalizedString("titleBlogMyBlogScreen", comment: "")
    static var textMyBlogScreen: String = NSLocalizedString("textMyBlogScreen", comment: "")
    static var tagSubtitleMyBlogScreen: String = NSLocalizedString("tagSubtitleMyBlogScreen", comment: "")
    static var tagTextMyBlogScreen: String = NSLocalizedString("tagTextMyBlogScreen", comment: "")
    static var editButtonMyBlogScreen: String = NSLocalizedString("editButtonMyBlogScreen", comment: "")
    static var nameSubTitleMyBlogScreen: String = NSLocalizedString("nameSubTitleMyBlogScreen", comment: "")
    static var dateSubTitleMyBlogScreen: String = NSLocalizedString("dateSubTitleMyBlogScreen", comment: "")
    static var shareSubtitleMyBlogScreen: String = NSLocalizedString("shareSubtitleMyBlogScreen", comment: "")
    static var likeSubtitleMyBlogScreen: String = NSLocalizedString("likeSubtitleMyBlogScreen", comment: "")
    static var arrayTagsIsEmptyMyBlogScreen: String = NSLocalizedString("arrayTagsIsEmptyMyBlogScreen", comment: "")
    
    //MARK: Another Blog Screen
    static var headerTitleAnotherBlogScreen: String = NSLocalizedString("headerTitleAnotherBlogScreen", comment: "")
    static var titleBlogAnotherBlogScreen: String = NSLocalizedString("titleBlogAnotherBlogScreen", comment: "")
    static var textAnotherBlogScreen: String = NSLocalizedString("textAnotherBlogScreen", comment: "")
    static var tagSubtitleAnotherBlogScreen: String = NSLocalizedString("tagSubtitleAnotherBlogScreen", comment: "")
    static var tagTextAnotherBlogScreen: String = NSLocalizedString("tagTextAnotherBlogScreen", comment: "")
    static var followButtonAnotherBlogScreen: String = NSLocalizedString("followButtonAnotherBlogScreen", comment: "")
    static var nameSubTitleAnotherBlogScreen: String = NSLocalizedString("nameSubTitleAnotherBlogScreen", comment: "")
    static var dateSubTitleAnotherBlogScreen: String = NSLocalizedString("dateSubTitleAnotherBlogScreen", comment: "")
    static var shareSubtitleAnotherBlogScreen: String = NSLocalizedString("shareSubtitleAnotherBlogScreen", comment: "")
    static var likeSubtitleAnotherBlogScreen: String = NSLocalizedString("likeSubtitleAnotherBlogScreen", comment: "")
    
    //MARK: Create Blog Screen
    static var headerTitleCreateBlogScreen: String = NSLocalizedString("headerTitleCreateBlogScreen", comment: "")
    static var nextButtonCreateBlogScreen: String = NSLocalizedString("nextButtonCreateBlogScreen", comment: "")
    static var draftButtonCreateBlogScreen: String = NSLocalizedString("draftButtonCreateBlogScreen", comment: "")
    static var textCreateBlogScreen: String = NSLocalizedString("textCreateBlogScreen", comment: "")
    static var alertTitleCreateBlogScreen: String = NSLocalizedString("alertTitleCreateBlogScreen", comment: "")
    static var alertMessageCreateBlogScreen: String = NSLocalizedString("alertMessageCreateBlogScreen", comment: "")
    static var alertButtonCancelCreateBlogScreen: String = NSLocalizedString("alertButtonCancelCreateBlogScreen", comment: "")
    
    //MARK: Setting Screen
    static var headerTitleSettingScreen: String = NSLocalizedString("headerTitleSettingScreen", comment: "")
    
    //MARK: My More Blogs Screen
    static var headerTitleMyMoreBlogsScreen: String = NSLocalizedString("headerTitleMyMoreBlogsScreen", comment: "")
    static var emptyArrayTitleMyMoreBlogsScreen: String = NSLocalizedString("emptyArrayTitleMyMoreBlogsScreen", comment: "")
    
    //MARK: Another More Blogs Screen
    static var headerTitleAnotherMoreBlogsScreen: String = NSLocalizedString("headerTitleAnotherMoreBlogsScreen",
                                                                             comment: "")
    static var emptyArrayTitleAnotherMoreBlogsScreen: String = NSLocalizedString("emptyArrayTitleAnotherMoreBlogsScreen",
                                                                                 comment: "")
    static var refreshControlAnotherMoreBlogsScreen: String = NSLocalizedString("refreshControlAnotherMoreBlogsScreen",
                                                                                comment: "")
    
    //MARK: Preview Screen
    static var leadingTwoButtonsPreviewScreen: String = NSLocalizedString("leadingTwoButtonsPreviewScreen", comment: "")
    static var tralingTwoButtonsPreviewScreen: String = NSLocalizedString("tralingTwoButtonsPreviewScreen", comment: "")
    static var startedButtonPreviewScreen: String = NSLocalizedString("startedButtonPreviewScreen", comment: "")
    static var pageOneTitltePreviewScreen: String = NSLocalizedString("pageOneTitltePreviewScreen", comment: "")
    static var pageOneTextPreviewScreen: String = NSLocalizedString("pageOneTextPreviewScreen", comment: "")
    static var pageTwoTitltePreviewScreen: String = NSLocalizedString("pageTwoTitltePreviewScreen", comment: "")
    static var pageTwoTextPreviewScreen: String = NSLocalizedString("pageTwoTextPreviewScreen", comment: "")
    static var pageThreeTitltePreviewScreen: String = NSLocalizedString("pageThreeTitltePreviewScreen", comment: "")
    static var pageThreeTextPreviewScreen: String = NSLocalizedString("pageThreeTextPreviewScreen", comment: "")
    
    //MARK: Page Screen
    static var titlePageScreen: String = NSLocalizedString("titlePageScreen", comment: "")
    static var subtitlePageScreen: String = NSLocalizedString("subtitlePageScreen", comment: "")

    //MARK: Tab Bar Screen
    static var homeTabBar: String = NSLocalizedString("homeTabBar", comment: "")
    static var searchTabBar: String = NSLocalizedString("searchTabBar", comment: "")
    static var savedTabBar: String = NSLocalizedString("savedTabBar", comment: "")
    static var profileTabBar: String = NSLocalizedString("profileTabBar", comment: "")
    
    //MARK: Blog Cell
    static var titleBlogCell: String = NSLocalizedString("titleBlogCell", comment: "")
    static var dateSubTitleBlogCell: String = NSLocalizedString("dateSubTitleBlogCell", comment: "")
    static var nameSubTitleBlogCell: String = NSLocalizedString("nameSubTitleBlogCell", comment: "")
    static var tagSubTitleBlogCell: String = NSLocalizedString("tagSubTitleBlogCell", comment: "")
    
    //MARK: Standart Blog Cell
    static var titleStandartBlogCell: String = NSLocalizedString("titleStandartBlogCell", comment: "")
    static var nameSubTitleStandartBlogCell: String = NSLocalizedString("nameSubTitleStandartBlogCell", comment: "")
    static var dateSubTitleStandartBlogCell: String = NSLocalizedString("dateSubTitleStandartBlogCell", comment: "")
    static var deleteActionStandartBlogCell: String = NSLocalizedString("deleteActionStandartBlogCell", comment: "")
    
    //MARK: Setting Cell
    static var titleSettingCell: String = NSLocalizedString("titleSettingCell", comment: "")
    static var subtitleSettingCell: String = NSLocalizedString("subtitleSettingCell", comment: "")
    static var buttonSettingCell: String = NSLocalizedString("buttonSettingCell", comment: "")
    static var togleButtonSettingCell: String = NSLocalizedString("togleButtonSettingCell", comment: "")
    
    //MARK: Choice Cell
    static var titleChoiceCell: String = NSLocalizedString("titleChoiceCell", comment: "")
    
    //MARK: Settins Array
    static var notificationTitleSettingArray: String = NSLocalizedString("notificationTitleSettingArray", comment: "")
    static var notificationSubtitleSettingArray: String = NSLocalizedString("notificationSubtitleSettingArray", comment: "")
    static var soundTitleSettingArray: String = NSLocalizedString("soundTitleSettingArray", comment: "")
    static var soundSubtitleSettingArray: String = NSLocalizedString("soundSubtitleSettingArray", comment: "")
    static var changeThemeTitleSettingArray: String = NSLocalizedString("changeThemeTitleSettingArray", comment: "")
    static var changeThemeSubtitleSettingArray: String = NSLocalizedString("changeThemeSubtitleSettingArray", comment: "")
    static var changeLanguageTitleSettingArray: String = NSLocalizedString("changeLanguageTitleSettingArray", comment: "")
    static var changeLanguageSubtitleSettingArray: String = NSLocalizedString("changeLanguageSubtitleSettingArray", comment: "")
    static var changePasswordTitleSettingArray: String = NSLocalizedString("changePasswordTitleSettingArray", comment: "")
    static var changePasswordSubtitleSettingArray: String = NSLocalizedString("changePasswordSubtitleSettingArray", comment: "")
    static var helpTitleSettingArray: String = NSLocalizedString("helpTitleSettingArray", comment: "")
    static var helpSubtitleSettingArray: String = NSLocalizedString("helpSubtitleSettingArray", comment: "")
    static var aboutTheApplicationTitleSettingArray: String = NSLocalizedString("aboutTheApplicationTitleSettingArray", comment: "")
    static var AboutTheApplicationSubtitleSettingArray: String =
        NSLocalizedString("AboutTheApplicationSubtitleSettingArray", comment: "")
    static var clearCacheTitleSettingArray: String = NSLocalizedString("clearCacheTitleSettingArray", comment: "")
    static var ClearCacheSubtitleSettingArray: String = NSLocalizedString("ClearCacheSubtitleSettingArray", comment: "")
    static var logOutTitleSettingArray: String = NSLocalizedString("logOutTitleSettingArray", comment: "")
    static var LogOutSubtitleSettingArray: String = NSLocalizedString("LogOutSubtitleSettingArray", comment: "")
    
    //MARK: Languages Application Dictionary
    static var englishLanguagesApplicationDictionary: String =
        NSLocalizedString("englishLanguagesApplicationDictionary", comment: "")
    static var russianLanguagesApplicationDictionary: String =
        NSLocalizedString("russianLanguagesApplicationDictionary", comment: "")
    
    //MARK: Colors Application Dictionary
    static var lightColorsApplicationDictonary: String = NSLocalizedString("lightColorsApplicationDictonary", comment: "")
    static var darkColorsApplicationDictonary: String = NSLocalizedString("darkColorsApplicationDictonary", comment: "")
    
}
