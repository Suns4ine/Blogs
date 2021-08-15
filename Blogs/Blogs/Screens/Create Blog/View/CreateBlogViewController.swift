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
    private var utilitiesArray: [String] = ["", "", "", "", "", "", "", "", "", ""]
    private let header: Header = {
        let header = Header(title: "",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        return header
    }()
    
    private let nextButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "nextButton")
        return button
    }()
    
    private let draftButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "draftButton")
        return button
    }()
    
    private let utilitiesView : UIView = {
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
        let text = Text(text: "text", size: .mm17)
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

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, nextButton, draftButton,
         utilitiesView, utilitiesCollectionView,
         borderView, text].forEach{ view.addSubview($0)}
        
        utilitiesCollectionView.delegate = self
        utilitiesCollectionView.dataSource = self
        utilitiesCollectionView.register(UtilitiesCollectionViewCell.self,
                                         forCellWithReuseIdentifier: UtilitiesCollectionViewCell.identifier)
        
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
            
            utilitiesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            utilitiesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            utilitiesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            utilitiesView.heightAnchor.constraint(equalToConstant: 56),
            
            borderView.topAnchor.constraint(equalTo: utilitiesView.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: utilitiesView.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: utilitiesView.trailingAnchor),
            borderView.heightAnchor.constraint(equalToConstant: 1),
            
            utilitiesCollectionView.topAnchor.constraint(equalTo: utilitiesView.topAnchor),
            utilitiesCollectionView.leadingAnchor.constraint(equalTo: utilitiesView.leadingAnchor),
            utilitiesCollectionView.trailingAnchor.constraint(equalTo: utilitiesView.trailingAnchor),
            utilitiesCollectionView.bottomAnchor.constraint(equalTo: utilitiesView.bottomAnchor),
            
            text.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 14),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            text.bottomAnchor.constraint(equalTo: utilitiesView.topAnchor, constant: -14)
        ])
    }
}

extension CreateBlogViewController: CreateBlogViewInput {
}

extension CreateBlogViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return utilitiesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UtilitiesCollectionViewCell.identifier,
                                                            for: indexPath) as? UtilitiesCollectionViewCell
                                                            else { return .init() }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 24, height: 24)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}
