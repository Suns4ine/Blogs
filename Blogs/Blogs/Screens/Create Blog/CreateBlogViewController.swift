//
//  CreateBlogViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class CreateBlogViewController: UIViewController {
	private let output: CreateBlogViewOutput

    //MARK: Объявление переменных
    private var section: UtiliesSectionRowPresentable = UtiliesSectionViewModel()
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleCreateBlogScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let nextButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: StandartLanguage.nextButtonCreateBlogScreen)
        button.addTarget(self, action: #selector(tapNextButton))
        return button
    }()
    
    private let draftButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: StandartLanguage.draftButtonCreateBlogScreen)
        button.addTarget(self, action: #selector(tapDraftButton))
        return button
    }()
    
    private let utilitiesView : UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.utilitiesBlogBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let utilitiesAutoLayoutView : UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.utilitiesBlogBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.borderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let utilitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let text: Text = {
        let text = Text(text: StandartLanguage.textCreateBlogScreen,
                        size: .mm17)
        text.editAligent(aligent: .natural)
        text.editScrollEnabled(edit: true)
        text.editWorkInText(edit: true)
        return text
    }()
    
    init(output: CreateBlogViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        output.setupText()
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        [header, nextButton, draftButton, text].forEach{ view.addSubview($0)}
//        [utilitiesView, utilitiesCollectionView,
//        borderView, utilitiesAutoLayoutView].forEach{ view.addSubview($0)}
        
        
        utilitiesCollectionView.delegate = self
        utilitiesCollectionView.dataSource = self
        utilitiesCollectionView.register(UtilitiesCollectionViewCell.self,
                                         forCellWithReuseIdentifier: UtilitiesCollectionViewCell.identifier)
        
        output.setupText()
        output.fetchUtiliesCell()
        
        view.backgroundColor = StandartColors.createBlogBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            nextButton.centerYAnchor.constraint(equalTo: header.leftIcon.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            draftButton.centerYAnchor.constraint(equalTo: header.leftIcon.centerYAnchor),
            draftButton.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -12),
            
//            utilitiesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            utilitiesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            utilitiesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            utilitiesView.heightAnchor.constraint(equalToConstant: 56),
//
//            borderView.topAnchor.constraint(equalTo: utilitiesView.topAnchor),
//            borderView.leadingAnchor.constraint(equalTo: utilitiesView.leadingAnchor),
//            borderView.trailingAnchor.constraint(equalTo: utilitiesView.trailingAnchor),
//            borderView.heightAnchor.constraint(equalToConstant: 1),
//
//            utilitiesCollectionView.topAnchor.constraint(equalTo: utilitiesView.topAnchor),
//            utilitiesCollectionView.leadingAnchor.constraint(equalTo: utilitiesView.leadingAnchor),
//            utilitiesCollectionView.trailingAnchor.constraint(equalTo: utilitiesView.trailingAnchor),
//            utilitiesCollectionView.bottomAnchor.constraint(equalTo: utilitiesView.bottomAnchor),
//
//            utilitiesAutoLayoutView.topAnchor.constraint(equalTo: utilitiesView.bottomAnchor),
//            utilitiesAutoLayoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            utilitiesAutoLayoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            utilitiesAutoLayoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            text.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 14),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14)
//            text.bottomAnchor.constraint(equalTo: utilitiesView.topAnchor, constant: -14)
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.giveText(text: text.textView.text)
        output.didTapBackButton()
    }
    
    @objc
    private func tapNextButton() {
        output.giveText(text: text.textView.text)
        output.didTapNextButton()
    }
    
    @objc
    private func tapDraftButton() {
        output.giveText(text: text.textView.text)
        output.didTapDraftButton()
    }
}

extension CreateBlogViewController: CreateBlogViewInput {
    func showText(text: String) {
        self.text.editText(text: text)
    }
    
    func reloadData(for section: UtiliesSectionViewModel) {
        self.section = section
        utilitiesCollectionView.reloadData()
    }
    
}

extension CreateBlogViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = section.rows[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier,
                                                            for: indexPath) as? UtilitiesCollectionViewCell
                                                            else { return .init() }
        cell.viewModel = viewModel
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: section.rows[indexPath.row].cellWidth, height: section.rows[indexPath.row].cellHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.section.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.didTapUtilitiesCollectionViewCell(at: indexPath)
    }
}
