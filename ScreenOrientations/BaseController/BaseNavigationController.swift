//
//  BaseNavigationController.swift
//  ScreenOrientations
//
//  Created by ucredit-XiaoYang on 2017/7/19.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}


// MARK: 重写屏幕旋转的关键方法
extension BaseNavigationController {
    
    override var shouldAutorotate: Bool {
        
        guard let VC = topViewController else {
            return false
        }
        
        return VC.shouldAutorotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        guard let VC = topViewController else {
            return .portrait
        }
        
        return VC.supportedInterfaceOrientations
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        
        guard let VC = topViewController else {
            return .portrait
        }
        
        return VC.preferredInterfaceOrientationForPresentation
    }
    
    
}




