//
//  PreviewPageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class PreviewPageViewController: UIPageViewController {
    
    var delegatePage: SomeProtocol?
    private lazy var arrayViewControllers: [UIViewController] = [
        PageViewController(numberPage: 0), PageViewController(numberPage: 1), PageViewController(numberPage: 2)
    ]
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
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
        
        self.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setViewControllers([arrayViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension PreviewPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PageViewController else { return nil }
        if let index = arrayViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                return arrayViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PageViewController else { return nil }
        if let index = arrayViewControllers.lastIndex(of: viewController) {
            if index < arrayViewControllers.count - 1 {
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
            delegatePage?.action(numb: vc.number)
        }
    }

}
