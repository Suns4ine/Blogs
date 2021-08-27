//
//  StandartLanguage.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.08.2021.
//

import Foundation

final class StandartLanguage: LanguagesApplicationProtocol {
    
    //MARK: Start Screen
    static var titleStartScreen: String = "Авторизация"
    static var textStartScreen: String = "Какой-то текст"
    static var mailButtonStartScreen: String = "Почта"
    static var facebookButtonStartScreen: String = "Facebook"
    static var twitterButtonStartScreen: String = "Twitter"
    
    //MARK: Login Screen
    static var headerTitleLoginScreen: String = ""
    static var titleLoginScreen: String = "Авторизация"
    static var signInButtonLoginScreen: String = "Войти"
    static var signUpButtonLoginScreen: String = "Или Зарегестрироваться"
    static var loginTextFieldNameLoginScreen: String = "Логин"
    static var loginTextFieldShadowTextLoginScreen: String = "Логин"
    static var loginTextFieldErrorLoginScreen: String = "Логин"
    static var passwordTextFieldNameLoginScreen: String = "Пароль"
    static var passwordTextFieldShadowTextLoginScreen: String = "Пароль"
    static var passwordTextFieldErrorLoginScreen: String = "Пароль"
    
    //MARK: Sign Up Screen
    static var headerTitleSignUpScreen: String = ""
    static var titleSignUpScreen: String = "Регистрация"
    static var textSignUpScreen: String = "Какой-то текст"
    static var registerButtonSignUpScreen: String = "Зарегестрироваться"
    static var nameTextFieldNameSignUpScreen: String = "Имя"
    static var nameTextFieldShadowTextSignUpScreen: String = "Имя"
    static var nameTextFieldErrorSignUpScreen: String = "Имя"
    static var mailTextFieldNameSignUpScreen: String = "Почта"
    static var mailTextFieldShadowTextSignUpScreen: String = "Почта"
    static var mailTextFieldErrorSignUpScreen: String = "Почта"
    static var passwordTextFieldNameSignUpScreen: String = "Пароль"
    static var passwordTextFieldShadowTextSignUpScreen: String = "Пароль"
    static var passwordTextFieldErrorSignUpScreen: String = "Пароль"
    
    //MARK: Home Screen
    static var headerTitleHomeScreen: String = "Блоги"
    static var emptyArrayTitleHomeScreen: String = "Какой-то текст"
    
    //MARK: Search Screen
    static var headerTitleSearchScreen: String = "Поиск"
    static var emptyArrayTitleSearchScreen: String = "Какой-то текст"
    static var searchTextFieldShadowTextSearchScreen: String = "Поиск..."
    
    //MARK: Saved Screen
    static var headerTitleSavedScreen: String = "Понравилось"
    static var emptyArrayTitleSavedScreen: String = "Какой-то текст"
    
    //MARK: My Profile Screen
    static var headerTitleMyProfileScreen: String = ""
    static var nameTitleMyProfileScreen: String = "Имя и Фамилия"
    static var nameTagSubtitleMyProfileScreen: String = "Тег Имя"
    static var editButtonMyProfileScreen: String = "Изменить"
    static var aboutMeSubTitleMyProfileScreen: String = "О Вас"
    static var aboutMeTextMyProfileScreen: String = "Какой-то текст"
    static var myBlogsSubTitleMyProfileScreen: String = "Ваши Блоги"
    static var createBlogButtonMyProfileScreen: String = "Создать Блог"
    static var moreBlogButtonMyProfileScreen: String = "Больше ваших Блогов"
    static var numberBlogTitleMyProfileScreen: String = "123456"
    static var followersBlogTitleMyProfileScreen: String = "123456"
    static var follovingBlogTitleMyProfileScreen: String = "123456"
    static var numberBlogNameTitleMyProfileScreen: String = "Блоги"
    static var followersBlogNameTitleMyProfileScreen: String = "Подписчики"
    static var follovingBlogNameTitleMyProfileScreen: String = "Подписки"
    
    //MARK: Another Profile Screen
    static var headerTitleAnotherProfileScreen: String = ""
    static var nameTitleAnotherProfileScreen: String = "Имя и Фамилия"
    static var nameTagSubtitleAnotherProfileScreen: String = "Тег Имя"
    static var followButtonAnotherProfileScreen: String = "Подписаться"
    static var aboutAnotherSubTitleAnotherProfileScreen: String = "О чужом пользователе"
    static var aboutAnotherTextAnotherProfileScreen: String = "Какой-то текст"
    static var anotherBlogsSubTitleAnotherProfileScreen: String = "Чужие Блоги"
    static var emptyTitleAnotherProfileScreen: String = "Какой-то текст"
    static var moreBlogButtonAnotherProfileScreen: String = "Больше чужих Блогов"
    static var numberBlogTitleAnotherProfileScreen: String = "123456"
    static var followersBlogTitleAnotherProfileScreen: String = "123456"
    static var follovingBlogTitleAnotherProfileScreen: String = "123456"
    static var numberBlogNameTitleAnotherProfileScreen: String = "Блоги"
    static var followersBlogNameTitleAnotherProfileScreen: String = "Подписчики"
    static var follovingBlogNameTitleAnotherProfileScreen: String = "Подписки"
    
    //MARK: Choice Language Screen
    static var headerTitleChoiceLanguageScreen: String = "Язык"
    static var emptyArrayTitleChoiceLanguageScreen: String = "Какой-то текст"
    
    //MARK: Choice Color Screen
    static var headerTitleChoiceColorScreen: String = "Тема"
    static var emptyArrayTitleChoiceColorScreen: String = "Какой-то текст"
    
    //MARK: Password Change Screen
    static var headerTitlePasswordChangeScreen: String = "Пароль"
    static var oldPasswordTextfieldNamePasswordChangeScreen: String = "Старый пароль"
    static var oldPasswordTextfieldShadowTextPasswordChangeScreen: String = "Старый пароль"
    static var oldPasswordTextfieldErrorPasswordChangeScreen: String = "Старый пароль"
    static var newPasswordTextfieldNamePasswordChangeScreen: String = "Новый пароль"
    static var newPasswordTextfieldShadowTextPasswordChangeScreen: String = "Новый пароль"
    static var newPasswordTextfieldErrorPasswordChangeScreen: String = "Новый пароль"
    static var repeatPasswordTextfieldNamePasswordChangeScreen: String = "Повтор пароля"
    static var repeatPasswordTextfieldShadowTextPasswordChangeScreen: String = "Повтор пароля"
    static var repeatPasswordTextfieldErrorPasswordChangeScreen: String = "Повтор пароля"
    static var saveButtonPasswordChangeScreen: String = "Сохранить"
    
    //MARK: Help Screen
    static var headerTitleHelpScreen: String = "Помощь"
    static var textHelpScreen: String = "Какой-то текст"
    static var emptyArrayTitleHelpScreen: String = "Какой-то текст"
    
    //MARK: About The Application Screen
    static var headerTitleAboutTheApplicationScreen: String = "О Приложении"
    static var textAboutTheApplicationScreen: String = "Какой-то текст"
    static var emptyArrayTitleAboutTheApplicationScreen: String = "Какой-то текст"

    //MARK: Draft Blogs Screen
    static var headerTitleDraftBlogsScreen: String = "Черновики"
    static var emptyArrayTitleDraftBlogsScreen: String = "Какой-то текст"
    
    //MARK: Edit Profile Screen
    static var headerTitleEditProfileScreen: String = "Редактирование"
    static var editAvatarButtonEditProfileScreen: String = "Изменить изображение"
    static var nameTextfieldNameEditProfileScreen: String = "Имя"
    static var nameTextfieldShadowTextEditProfileScreen: String = "Имя"
    static var nameTextfieldErrorEditProfileScreen: String = "Имя"
    static var surnameTextfieldNameEditProfileScreen: String = "Фамилия"
    static var surnameTextfieldShadowTextEditProfileScreen: String = "Фамилия"
    static var surnameTextfieldErrorEditProfileScreen: String = "Фамилия"
    static var tagNameTextfieldNameEditProfileScreen: String = "Тег Имя"
    static var tagNameTextfieldShadowTextEditProfileScreen: String = "Тег Имя"
    static var tagNameTextfieldErrorEditProfileScreen: String = "Тег Имя"
    static var aboutMeTextEditProfileScreen: String = "О Вас"
    static var aboutMeSubTitleEditProfileScreen: String = "О Вас"
    static var aboutMeErrorSubTitleEditProfileScreen: String = "О Вас"
    static var saveButtonEditProfileScreen: String = "Сохранить"
    
    //MARK: Addition Blog Screen
    static var headerTitleAdditionBlogScreen: String = ""
    static var nextButtonAdditionBlogScreen: String = "Закончить"
    static var blogTitleSubTitleAdditionBlogScreen: String = "Заголовок"
    static var tagSubTitleAdditionBlogScreen: String = "Теги"
    static var blogTitleErrorSubTitleAdditionBlogScreen: String = "Заголовок"
    static var tagErrorSubTitleAdditionBlogScreen: String = "Теги"
    static var blogTitleTextAdditionBlogScreen: String = "Какой-то текст"
    static var tagTextAdditionBlogScreen: String = "Какой-то текст"
    
    //MARK: My Blog Screen
    static var headerTitlteMyBlogScreen: String = ""
    static var titleBlogMyBlogScreen: String = "Заголовок"
    static var textMyBlogScreen: String = "Какой-то текст"
    static var tagSubtitleMyBlogScreen: String = "Тег"
    static var tagTextMyBlogScreen: String = "Какой-то текст"
    static var editButtonMyBlogScreen: String = "Изменить"
    static var nameSubTitleMyBlogScreen: String = "Имя и Фамилия"
    static var dateSubTitleMyBlogScreen: String = "Дата"
    static var shareSubtitleMyBlogScreen: String = "Поделиться"
    static var likeSubtitleMyBlogScreen: String = "Нравится"
    
    //MARK: Another Blog Screen
    static var headerTitleAnotherBlogScreen: String = ""
    static var titleBlogAnotherBlogScreen: String = "Заголовок"
    static var textAnotherBlogScreen: String = "Какой-то текст"
    static var tagSubtitleAnotherBlogScreen: String = "Тег"
    static var tagTextAnotherBlogScreen: String = "Какой-то текст"
    static var followButtonAnotherBlogScreen: String = "Подписаться"
    static var nameSubTitleAnotherBlogScreen: String = "Имя и Фамилия"
    static var dateSubTitleAnotherBlogScreen: String = "Дата"
    static var shareSubtitleAnotherBlogScreen: String = "Поделиться"
    static var likeSubtitleAnotherBlogScreen: String = "Нравится"
    
    //MARK: Create Blog Screen
    static var headerTitleCreateBlogScreen: String = ""
    static var nextButtonCreateBlogScreen: String = "Далее"
    static var draftButtonCreateBlogScreen: String = "Черновики"
    static var textCreateBlogScreen: String = "Какой-то текст"
    
    //MARK: Setting Screen
    static var headerTitleSettingScreen: String = "Настройки"
    
    //MARK: My More Blogs Screen
    static var headerTitleMyMoreBlogsScreen: String = "Ваши Блоги"
    static var emptyArrayTitleMyMoreBlogsScreen: String = "Какой-то текст"
    
    //MARK: Another More Blogs Screen
    static var headerTitleAnotherMoreBlogsScreen: String = "Чужие Блоги"
    static var emptyArrayTitleAnotherMoreBlogsScreen: String = "Какой-то текст"
    
    //MARK: Preview Screen
    static var leadingTwoButtonsPreviewScreen: String = "Пропуск"
    static var tralingTwoButtonsPreviewScreen: String = "Далее"
    static var startedButtonPreviewScreen: String = "Начать"
    
    //MARK: Page Screen
    static var titlePageScreen: String = "Заголовок"
    static var subtitlePageScreen: String = "Какой-то текст"

    //MARK: Tab Bar Screen
    static var homeTabBar: String = "Домой"
    static var searchTabBar: String = "Поиск"
    static var savedTabBar: String = "Понравилось"
    static var profileTabBar: String = "Профиль"
    
    //MARK: Blog Cell
    static var titleBlogCell: String = "Заголовок"
    static var dateSubTitleBlogCell: String = "Дата"
    static var nameSubTitleBlogCell: String = "Имя и Фамилия"
    static var tagSubTitleBlogCell: String = "Тег"
    
    //MARK: Standart Blog Cell
    static var titleStandartBlogCell: String = "Заголовок"
    static var nameSubTitleStandartBlogCell: String = "Имя и Фамилия"
    static var dateSubTitleStandartBlogCell: String = "Дата"
    
    //MARK: Setting Cell
    static var titleSettingCell: String = "Заголовок"
    static var subtitleSettingCell: String = "Какой-то текст"
    static var buttonSettingCell: String = "Настройка"
    static var togleButtonSettingCell: String = ""
    
    //MARK: Choice Cell
    static var titleChoiceCell: String = "Выбор"
    
    
}
