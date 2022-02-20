//
//  TextField.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 09.08.2021.
//

import Foundation
import UIKit

final class TextField: UIView, UITextFieldDelegate {
    
    //MARK: Create Variable
    var delegate: UITextFieldDelegate?
    private var isSecureTextEntry = false
    private (set) var password: String = ""
    private var textInPassword: [String] = []
    
    private let nameSubTitle: SubTitle = {
        let text = SubTitle(text: "nameText", size: .mm15)
        text.editAligent(aligent: .left)
        return text
    }()
    
    private let errorSubTitle: SubTitle = {
        let text = SubTitle(text: "errorText", size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    private (set) lazy var textField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.autocapitalizationType = .none
        
        textField.indent(size: 16)
        textField.tintColor = StandartColors.highlightTextColor
        textField.textColor = StandartColors.enteredTextColor
        textField.font = .secondTextFont
        textField.layer.cornerRadius = CGFloat.standartCornerRadiusConstant
        textField.layer.borderWidth = CGFloat.borderConstant
        textField.layer.borderColor = StandartColors.titleColor.cgColor
        textField.backgroundColor = StandartColors.standartBackgroundColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    //MARK: System override Functions
    convenience init(name: String, shadowText: String, error: String) {
        self.init()
        nameSubTitle.editText(text: name)
        errorSubTitle.editText(text: error)
        
        textField.attributedPlaceholder = NSAttributedString(string: shadowText,
                                                             attributes: [NSAttributedString.Key.foregroundColor : StandartColors.textForTextfieldBackgroundColor.withAlphaComponent(0.5)])
        setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        //Делаем проверку на флаг, чтобы знать, отображать текст или нет (Защита для паролей)
        if isSecureTextEntry {
            if string.isEmpty {
                password = String(password.dropLast())
                textField.text = String(textField.text?.dropLast() ?? "")
            } else {
                textInPassword = []
                textInPassword = Array(repeating: "●", count: string.count)
                password = password + string
                textField.text = (textField.text ?? "") + textInPassword.joined()
            }
            return false
        }
        return true
    }

    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: CGFloat.textFieldHeightConstant),
            
            nameSubTitle.topAnchor.constraint(equalTo: self.topAnchor),
            nameSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.standartIdentConstant - 5),
            nameSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameSubTitle.heightAnchor.constraint(equalToConstant: CGFloat.subTitleHeight20Constant),
            
            errorSubTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            errorSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.standartIdentConstant - 5),
            errorSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            errorSubTitle.heightAnchor.constraint(equalToConstant: CGFloat.subTitleHeight20Constant),
            
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.topAnchor.constraint(equalTo: nameSubTitle.bottomAnchor, constant: CGFloat.minimumIdentConstant),
            textField.bottomAnchor.constraint(equalTo: errorSubTitle.topAnchor, constant: -CGFloat.minimumIdentConstant)
        ])
    }
    
    //MARK: Personal Functions
    private func setup() {
        [nameSubTitle, errorSubTitle, textField].forEach{ addSubview($0)}
        
        delegate = textField.delegate
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension TextField {
    func editErrorText(text: String) {
        errorSubTitle.editText(text: text)
    }
    
    func editNameColor(color: UIColor) {
        nameSubTitle.editColor(color: color)
    }
    
    func editErrorColor(color: UIColor) {
        errorSubTitle.editColor(color: color)
    }
    
    func editSecureTextEntry(entry: Bool) {
        isSecureTextEntry = entry
    }
    
    func editAutocapitalizationType(type: UITextAutocapitalizationType) {
        textField.autocapitalizationType = type
    }
    
    func clearText() {
        textField.text = ""
    }
    
    func addText(text: String) {
        textField.text = text
    }
    
    func addTag(numb: Int) {
        textField.tag = numb
    }
}