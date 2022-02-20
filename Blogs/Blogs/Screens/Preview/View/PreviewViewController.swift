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
    
    //MARK: Private Property
    
    private let output: PreviewViewOutput
    
    private var section: PageSectionRowPresentable = PageSectionViewModel()
    private var twoButtonsBottonConstraint: NSLayoutConstraint?
    private var smallCircleArray = [UIView]()
    
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
    
    private let sliderStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    //MARK: Inits
    
    init(output: PreviewViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Life Cycle
    
	override func viewDidLoad() {
		super.viewDidLoad()
        output.fetchViewPages()
        
        addSubViewInView()
        add(pageViewController)
        addLayoutSubviews()
        editColorViews(numb: 0)
        
        view.backgroundColor = .firstBlue
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: Public Methods
    
    func numbPage(numb: Int) {
        output.newPage(numb: numb)
        editColorViews(numb: numb)
    }
    
    //MARK: Private Methods
    
    private func addSubViewInView() {
        [twoButtons, circle, sliderStackView, startedButton].forEach{ view.addSubview($0) }
        smallCircleArray.forEach{ sliderStackView.addArrangedSubview($0) }
    }
    
    private func addLayoutSubviews() {
        
        twoButtonsBottonConstraint = twoButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                                        constant: -CGFloat.standartIdentConstant)
        twoButtonsBottonConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            twoButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: CGFloat.standartIdentConstant),
            twoButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -CGFloat.standartIdentConstant),
            
            startedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -CGFloat.standartIdentConstant),
            startedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: CGFloat.standartIdentConstant),
            startedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -CGFloat.standartIdentConstant),
            
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                        constant: CGFloat.standartIdentConstant + 14),
            circle.widthAnchor.constraint(equalToConstant: view.frame.width - CGFloat.circlePreviewIdentConstant),
            circle.heightAnchor.constraint(equalToConstant: view.frame.width - CGFloat.circlePreviewIdentConstant),
            
            sliderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderStackView.bottomAnchor.constraint(equalTo: startedButton.topAnchor,
                                                    constant: -(CGFloat.standartIdentConstant - 4)),
                        
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: startedButton.topAnchor)
        ])
        
        //Так как мы не знаем с самого начала размер заднего круга, то после вычисления выше, мы можем его округлить
        circle.layer.cornerRadius = (view.frame.width - CGFloat.circlePreviewIdentConstant) / 2
    }
    
    //Изменяем цвета, в зависимости от номера страницы
    private func editColorViews(numb: Int) {
        switch numb {
        case 0:
            UIView.animate(withDuration: 0.25,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.circle.backgroundColor = .firstYellow
                            self.view.backgroundColor = .firstBlue
                            self.updateSmallCircles(numb: 1, color: .firstSunnyRed)
                            })
        case 1:
            UIView.animate(withDuration: 0.25,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.circle.backgroundColor = .firstSunnyRed
                            self.view.backgroundColor = .firstWhite
                            self.updateSmallCircles(numb: 2, color: .firstSunnyRed)
                            })
        case 2:
            UIView.animate(withDuration: 0.25,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.circle.backgroundColor = .firstYellow
                            self.view.backgroundColor = .firstSunnyRed
                            self.updateSmallCircles(numb: 3, color: .firstYellow)
                            })
        default: break
        }
    }
    
    private func addSmallCircleInArray(numb: Int) {
        guard numb > 0 else { return }
        smallCircleArray = []
        
        for _ in 0..<numb {
            let circle = UIView()
            circle.layer.cornerRadius = CGFloat.smallCircleHeightConstant/2
            circle.layer.borderWidth = CGFloat.borderConstant
            circle.layer.borderColor = UIColor.firstBlack.cgColor
            circle.translatesAutoresizingMaskIntoConstraints = false
            
            circle.heightAnchor.constraint(equalToConstant: CGFloat.smallCircleHeightConstant).isActive = true
            circle.widthAnchor.constraint(equalToConstant: CGFloat.smallCircleHeightConstant).isActive = true
            
            smallCircleArray.append(circle)
        }
        
        sliderStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        smallCircleArray.forEach{ sliderStackView.addArrangedSubview($0) }
    }
    
    private func updateSmallCircles(numb: Int, color: UIColor) {
        
        for count in 0..<smallCircleArray.count {
            if count < numb {
                smallCircleArray[count].backgroundColor = color
            } else {
                smallCircleArray[count].backgroundColor = .clear
            }
        }
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
        twoButtonsBottonConstraint?.constant = CGFloat.standartIdentConstant
    }
    
    func reloadData(for section: PageSectionViewModel) {
        self.section = section
        addSmallCircleInArray(numb: section.rows.count)
    }
}
