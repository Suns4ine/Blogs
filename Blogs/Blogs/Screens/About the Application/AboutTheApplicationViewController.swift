//
//  AboutTheApplicationViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AboutTheApplicationViewController: UIViewController {
	private let output: AboutTheApplicationViewOutput

    //MARK: Объявление переменных
    private let header: Header = {
        let header = Header(title: "Об Приложении",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let text: Text = {
        let text = Text(text: "text", size: .mm15)
        text.editAligent(aligent: .natural)
        text.editScrollEnabled(edit: true)
        return text
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: "Здесь пока ничего нет", size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    init(output: AboutTheApplicationViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, text, emptyArrayTitle].forEach{ view.addSubview($0)}
        
        text.editText(text: someText)
        emptyArrayTitle.isHidden = someText.isEmpty ? false : true
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            text.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 15),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    //MARK: Тест текствью
    private var someText = """
        Descriptive and consistent naming makes software easier to read and understand. Use the Swift naming conventions described in the API Design Guidelines. Some key takeaways include:

    striving for clarity at the call site
    prioritizing clarity over brevity
    using camelCase (not snake_case)
    using UpperCamelCase for types and protocols, lowerCamelCase for everything else
    including all needed words while omitting needless words
    using names based on roles, not types
    sometimes compensating for weak type information
    striving for fluent usage
    beginning factory methods with make
    naming methods for their side effects
    verb methods follow the -ed, -ing rule for the non-mutating version
    noun methods follow the formX rule for the mutating version
    boolean types should read like assertions
    protocols that describe what something is should read as nouns
    protocols that describe a capability should end in -able or -ible
    using terms that don't surprise experts or confuse beginners
    generally avoiding abbreviations
    using precedent for names
    preferring methods and properties to free functions
    casing acronyms and initialisms uniformly up or down
    giving the same base name to methods that share the same meaning
    avoiding overloads on return type
    choosing good parameter names that serve as documentation
    preferring to name the first parameter instead of including its name in the method name, except as mentioned under Delegates
    labeling closure and tuple parameters
    taking advantage of default parameters
    Prose
    When referring to methods in prose, being unambiguous is critical. To refer to a method name, use the simplest form possible.

    Write the method name with no parameters. Example: Next, you need to call addTarget.
    Write the method name with argument labels. Example: Next, you need to call addTarget(_:action:).
    Write the full method name with argument labels and types. Example: Next, you need to call addTarget(_: Any?, action: Selector?).
    For the above example using UIGestureRecognizer, 1 is unambiguous and preferred.

    Pro Tip: You can use Xcode's jump bar to lookup methods with argument labels. If you’re particularly good at mashing lots of keys simultaneously, put the cursor in the method name and press Shift-Control-Option-Command-C (all 4 modifier keys) and Xcode will kindly put the signature on your clipboard.
    """
}

extension AboutTheApplicationViewController: AboutTheApplicationViewInput {
}
