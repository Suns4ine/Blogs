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
    
    private let nameText: Text = {
        let text = Text(text: "nameText", size: .little)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.enteredTextColor)
        return text
    }()
    
    private let errorText: Text = {
        let text = Text(text: "errorText", size: .little)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    private lazy var textField: UITextField = {
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
        textField.layer.borderColor = StandartColors.TitleColor.cgColor
        textField.backgroundColor = StandartColors.standartBackgroundColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    convenience init(name: String, shadowText: String, error: String) {
        self.init()
        nameText.editText(text: name)
        errorText.editText(text: error)
        
        textField.attributedPlaceholder = NSAttributedString(string: shadowText,
                                                             attributes: [NSAttributedString.Key.foregroundColor : StandartColors.textForTextfieldBackgroundColor.withAlphaComponent(0.5)])
        
        setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
      //  setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func editErrorText(text: String) {
        errorText.editText(text: text)
    }
    
    private func setup() {
        [nameText, errorText, textField].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.resignFirstResponder() 
    delegate?.action(text: textField.text ?? "")
    return true
}
    

    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 106),
            
            nameText.topAnchor.constraint(equalTo: self.topAnchor),
            nameText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            nameText.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameText.heightAnchor.constraint(equalToConstant: 20),
            
            errorText.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            errorText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19),
            errorText.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            errorText.heightAnchor.constraint(equalToConstant: 20),
            
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: errorText.topAnchor, constant: -5)
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
