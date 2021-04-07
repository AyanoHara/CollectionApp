//
//  PageViewController.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/03/05.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var pageViewControllers: [UIViewController] = []
    let vcID = ["pageA", "pageB", "pageC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        let vc0 = storyboard!.instantiateViewController(withIdentifier: vcID[0])
        let vc1 = storyboard!.instantiateViewController(withIdentifier: vcID[1])
        let vc2 = storyboard!.instantiateViewController(withIdentifier: vcID[2]) 
        
        pageViewControllers = [vc0, vc1, vc2]
        
        //最初に表示するページの指定
        self.setViewControllers([vc0], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == 0 {
            return nil
        } else {
            return pageViewControllers[index! - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == pageViewControllers.count - 1 {
            return nil
        } else {
            return pageViewControllers[index! + 1]
        }
    }
}
