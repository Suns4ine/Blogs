//
//  PreviewPageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class PreviewPageViewController: UIPageViewController {
    
    private var numbPage = 0
    var delegatePage: PageProtocol?
    private var section: PageSectionRowPresentable?
    
    private lazy var arrayViewControllers: [UIViewController] = []
    
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
    
    private func fillArrayViewControllers() {
        
        guard let section = section else { return }
        
        for model in section.rows {
            arrayViewControllers.append(PageViewController(pageModel: model))
        }
        
        setViewControllers([arrayViewControllers[numbPage]], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        fillArrayViewControllers()
        
        self.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func nextPage() {
        
        numbPage = numbPage + 1 > arrayViewControllers.count - 1 ? numbPage : numbPage + 1
        
        setViewControllers([arrayViewControllers[numbPage]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
        delegatePage?.numbPage(numb: numbPage)
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
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let vc = pageViewController.viewControllers?[0] as? PageViewController {
            delegatePage?.numbPage(numb: vc.number)
        }
    }

}
