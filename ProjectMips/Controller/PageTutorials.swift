//
//  PageTutorials.swift
//  ProjectMips
//
//  Created by Amin Fadul on 4/30/18.
//  Copyright © 2018 ProjectMips. All rights reserved.
//

import UIKit

/// show to the user screens tutorials
class PageTutorials: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    /// Array of screens tutorials
    lazy var VCArr: [UIViewController] = {
        return [self.VCInstance(name: "First"),
                self.VCInstance(name: "Second"),
                self.VCInstance(name: "Third"),
                self.VCInstance(name: "Fourth")]}()
    
    
    /// Create and instantiate view controllers
    ///
    /// - Parameter name: view controller name
    /// - Returns: new view controller
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArr.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = .clear
            }
        }
        
    }
    
    /// Navigate to the previous view
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard VCArr.count > previousIndex else {
            return nil
        }
        return VCArr[previousIndex]
        
    }
    
    /// Navigate to the next view
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < VCArr.count else {
            return nil
        }
        
        guard VCArr.count > nextIndex else {
            return nil
        }
        return VCArr[nextIndex]
    }
    
    
    /// Get number of views
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
    }
    
    
    /// show first view when view is load
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
    
}

