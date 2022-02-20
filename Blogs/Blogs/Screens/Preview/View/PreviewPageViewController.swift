//
//  PreviewPageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class PreviewPageViewController: UIPageViewController {
    
    //MARK: Public Property
    
    var delegatePage: PageProtocol?
    
    //MARK: Private Property
    
    private var numbPage = 0
    private var section: PageSectionRowPresentable?
    private var arrayViewControllers: [UIViewController] = []
    
    //MARK: Life Cycle
    
    convenience init(section: PageSectionRowPresentable) {
        self.init()
        
        self.section = section
    }
    
    private override init(transitionStyle style: UIPageViewController.TransitionStyle,
                          navigationOrientation: UIPageViewController.NavigationOrientation,
                          options: [UIPageViewController.OptionsKey : Any]? = nil) {

        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        fillArrayViewControllers()
        
        self.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: Public Methods
    
    //Изменить страницу (вызывается из вне, по кнопке)
    func nextPage() {
        numbPage = numbPage + 1 > arrayViewControllers.count - 1 ? numbPage : numbPage + 1
        
        setViewControllers([arrayViewControllers[numbPage]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
        delegatePage?.numbPage(numb: numbPage)
    }
    
    //MARK: Private Methods
    
    //Заполняем массив контроллеров нашими viewModel'ями из section
    private func fillArrayViewControllers() {
        guard let section = section else { return }
        
        for model in section.rows {
            guard let pageModel = model as? PageViewModel else { return }
            
            let pageViewController = PageViewController()
            pageViewController.viewModel = pageModel
            
            arrayViewControllers.append(pageViewController)
        }
        setViewControllers([arrayViewControllers[numbPage]], direction: .forward, animated: true, completion: nil)
    }
}

extension PreviewPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PageViewController else { return nil }
        if let index = arrayViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                numbPage -= 1
                return arrayViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PageViewController else { return nil }
        if let index = arrayViewControllers.lastIndex(of: viewController) {
            if index < arrayViewControllers.count - 1 {
                numbPage += 1
                return arrayViewControllers[index + 1]
            }
        }
        return nil
    }
    
    //Передаем номер страницы
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let vc = pageViewController.viewControllers?[0] as? PageViewController {
            delegatePage?.numbPage(numb: vc.number)
        }
    }
}
