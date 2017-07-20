//
//  MainViewController.swift
//  ScreenOrientations
//
//  Created by ucredit-XiaoYang on 2017/7/19.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

import UIKit

class MainViewController: BaseTabBarController {
    
    fileprivate var myArray: Array <UINavigationController> = [];

    override func viewDidLoad() {
        super.viewDidLoad()

        let titles: Array <NSString> = ["one", "two"];
        let controllers: Array <UIViewController> = [OneViewController(), TwoViewController()];
        
        for (index, value) in controllers.enumerated() {
            setVC(vc: value, title: titles[index], normalImage: titles[index], tag: index)
        }
        
        self.viewControllers = myArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}


extension MainViewController {
    
    fileprivate func setVC(vc:UIViewController, title:NSString, normalImage:NSString, tag:NSInteger) -> Void {
        
        /** 创建viewController */
        let VC = vc;
        
        vc.title = title as String;
        /** 创建NavigationController */
        let nav = BaseNavigationController.init(rootViewController: VC)
        /** 创建图片 */
        let image = UIImage.init(named: title as String)
        /** 创建Tabbar选中图片 */
        nav.tabBarItem.selectedImage = UIImage.init(named: "\(title)_selected" as String)
        
        nav.tabBarItem = UITabBarItem.init(title: title as String, image: image, tag: tag)
        
        self.myArray.insert(nav, at: self.myArray.count)
        
    }
    
}
