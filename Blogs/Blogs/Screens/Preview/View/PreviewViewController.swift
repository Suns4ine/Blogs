//
//  PreviewViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import UIKit

protocol PageProtocol {
    func numbPage(numb: Int)
}

final class PreviewViewController: UIViewController , PageProtocol {

	private let output: PreviewViewOutput
    
    //MARK: Create Variable
    private var section: PageSectionRowPresentable = PageSectionViewModel()
    private var twoButtonsBottonConstraint: NSLayoutConstraint?
    
    private lazy var pageViewController: PreviewPageViewController = {
        let controller = PreviewPageViewController(section: section)
        controller.delegatePage = self
        controller.view.layer.zPosition = 1
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    private lazy var circle: UIView = {
        let view = UIView()
        view.layer.zPosition = 1
        view.backgroundColor = .firstYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let smallCircleOne: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.firstBlack.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let smallCircleTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.firstBlack.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let smallCircleThree: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.firstBlack.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let twoButtons: TwoButtons = {
        let buttons = TwoButtons(stringLeading: StandartLanguage.leadingTwoButtonsPreviewScreen,
                                 stringTrailing: StandartLanguage.tralingTwoButtonsPreviewScreen)
        buttons.addTrailingButtonTarget(self, action: #selector(tapTralingButton))
        buttons.addLeadingButtonTarget(self, action: #selector(tapLeadingButton))
        buttons.layer.zPosition = 2
        return buttons
    }()
    
    private let startedButton: SecondBigButton = {
        let button = SecondBigButton(text: StandartLanguage.startedButtonPreviewScreen,
                                     icon: .none)
        button.addTarget(self, action: #selector(tapStartButton))
        button.alpha = 0.0
        return button
    }()
    
    private let sliderView: UIView = {
        let view = UIView()
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: System override Functions
    init(output: PreviewViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        output.fetchViewPages()
        
        addViews()
        editView(numb: 0)
        add(pageViewController)
        
        view.backgroundColor = .firstBlue
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        
        twoButtonsBottonConstraint = twoButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                                        constant: -24)
        twoButtonsBottonConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            twoButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            twoButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            startedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            startedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            startedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 38),
            circle.widthAnchor.constraint(equalToConstant: view.frame.width - 66),
            circle.heightAnchor.constraint(equalToConstant: view.frame.width - 66),
            
            smallCircleOne.topAnchor.constraint(equalTo: sliderView.topAnchor),
            smallCircleOne.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor),
            smallCircleOne.bottomAnchor.constraint(equalTo: sliderView.bottomAnchor),
            smallCircleOne.heightAnchor.constraint(equalToConstant: 12),
            smallCircleOne.widthAnchor.constraint(equalToConstant: 12),
            
            smallCircleTwo.topAnchor.constraint(equalTo: sliderView.topAnchor),
            smallCircleTwo.leadingAnchor.constraint(equalTo: smallCircleOne.trailingAnchor, constant: 8),
            smallCircleTwo.heightAnchor.constraint(equalToConstant: 12),
            smallCircleTwo.widthAnchor.constraint(equalToConstant: 12),
            
            smallCircleThree.topAnchor.constraint(equalTo: sliderView.topAnchor),
            smallCircleThree.leadingAnchor.constraint(equalTo: smallCircleTwo.trailingAnchor, constant: 8),
            smallCircleThree.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor),
            smallCircleThree.heightAnchor.constraint(equalToConstant: 12),
            smallCircleThree.widthAnchor.constraint(equalToConstant: 12),
            
            sliderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderView.bottomAnchor.constraint(equalTo: startedButton.topAnchor, constant: -20),
            
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: startedButton.topAnchor)
        ])
        
        //Так как мы не знаем с самого начала размер заднего круга, то после вычисления выше, мы можем его округлить
        circle.layer.cornerRadius = (view.frame.width - 66) / 2
    }
    
    //MARK: Personal Functions
    func numbPage(numb: Int) {
        output.newPage(numb: numb)
        editView(numb: numb)
    }
    
    //Изменяем цвета, в зависимости от номера страницы
    private func editView(numb: Int) {
        switch numb {
        case 0:
            UIView.animate(withDuration: 0.25,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.circle.backgroundColor = .firstYellow
                            self.view.backgroundColor = .firstBlue
                            self.smallCircleOne.backgroundColor = .firstSunnyRed
                            self.smallCircleTwo.backgroundColor = .clear
                            })
        case 1:
            UIView.animate(withDuration: 0.25,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.circle.backgroundColor = .firstSunnyRed
                            self.view.backgroundColor = .firstWhite
                            self.smallCircleOne.backgroundColor = .firstSunnyRed
                            self.smallCircleTwo.backgroundColor = .firstSunnyRed
                            self.smallCircleThree.backgroundColor = .clear
                            })
        case 2:
            UIView.animate(withDuration: 0.25,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.circle.backgroundColor = .firstYellow
                            self.view.backgroundColor = .firstSunnyRed
                            self.smallCircleOne.backgroundColor = .firstYellow
                            self.smallCircleTwo.backgroundColor = .firstYellow
                            self.smallCircleThree.backgroundColor = .firstYellow
                            })
        default: break
        }
    }
    
    private func addViews() {
        [twoButtons, circle, sliderView, startedButton].forEach{ view.addSubview($0) }
        [smallCircleOne, smallCircleTwo, smallCircleThree].forEach{ sliderView.addSubview($0) }
    }
    
    @objc
    private func tapTralingButton() {
        pageViewController.nextPage()
    }
    
    @objc
    private func tapLeadingButton() {
        output.didTapLeadingButton()
    }
    
    @objc
    private func tapStartButton() {
        output.didTapStartButton()
    }
}

extension PreviewViewController: PreviewViewInput {
    //Изменяем кнопки если достгли финальной страницы
    func setupFinalChanges() {

        UIView.animate(withDuration: 0.3, animations: {
            self.twoButtons.alpha = 0.0
        })
            
        UIView.animate(withDuration: 0.7, animations: {
            self.startedButton.alpha = 1
            self.startedButton.isHidden = false
        })
        
        twoButtons.isHidden = true
        twoButtonsBottonConstraint?.constant = 24
    }
    
    func reloadData(for section: PageSectionViewModel) {
        self.section = section
    }
}
