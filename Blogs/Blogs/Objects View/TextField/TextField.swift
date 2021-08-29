//
//  TextField.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 09.08.2021.
//

import Foundation
import UIKit

protocol TextFieldDelegateProtocol {
    func action(text: String)
}

final class TextField: UIView, UITextFieldDelegate {
    
    var delegate: TextFieldDelegateProtocol?
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
        
        textField.indent(size: 16)
        textField.tintColor = StandartColors.enteredTextColor
        textField.textColor = StandartColors.enteredTextColor
        textField.font = .secondTextFont
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 2
        textField.layer.borderColor = StandartColors.titleColor.cgColor
        textField.backgroundColor = StandartColors.standartBackgroundColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func clearText() {
        textField.text = ""
    }
    
    func addText(text: String) {
        textField.text = text
    }
    
    private func setup() {
        [nameSubTitle, errorSubTitle, textField].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.resignFirstResponder()
        if isSecureTextEntry {
            delegate?.action(text: password)
        } else {
            delegate?.action(text: textField.text ?? "")
        }
    return true
}
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
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
            self.heightAnchor.constraint(equalToConstant: 106),
            
            nameSubTitle.topAnchor.constraint(equalTo: self.topAnchor),
            nameSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            nameSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            errorSubTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            errorSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            errorSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            errorSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.topAnchor.constraint(equalTo: nameSubTitle.bottomAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: errorSubTitle.topAnchor, constant: -5)
        ])
    }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
        
        self.rightView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.rightViewMode = .always
    }
}
