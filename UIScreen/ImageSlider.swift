//
//  ImageSlider.swift
//  UIScreen
//
//  Created by sara.galal on 10/8/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class ImageSlider: UIViewController {
    var pageViewController: UIPageViewController!
    var images = [String]()
    var titles = [String]()
    var pages = [Page]()
    var imageNumber :Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        for ind in images.indices{
            var page = Page()
            page.image = images[ind]
            page.title = images[ind]
            pages.append(page)
        }
        print("pages", pages)
        self.view.backgroundColor = UIColor.hexStringToUIColor(hex: "323232")
        let pc = UIPageControl.appearance()
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.darkGray
        pc.backgroundColor = UIColor.hexStringToUIColor(hex: "323232")
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.restartAction(self)
        self.addChild(self.pageViewController)
         self.pageViewController.view.frame = self.view.frame
        let views = [
            "pg": self.pageViewController.view
        ]
        for (_, v) in views {
            v!.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(v!)
        }
    }
    func restartAction(_ sender: AnyObject) {
        self.pageViewController.setViewControllers([self.viewControllerAtIndex(index: imageNumber!)], direction: .forward, animated: true, completion: nil)
    }
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if (pages.count == 0) || (index >= pages.count) {
            return ContentViewController(nibName: "ContentViewController", bundle: .main)
        }
        let vc = ContentViewController(nibName: "ContentViewController", bundle: .main)
        vc.pageIndex = index
        vc.imageName = pages[index].image
        vc.titleText = pages[index].title
        return vc
    }
}
extension ImageSlider: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if (index == pages.count) {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
