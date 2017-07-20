//
//  PresentLandscapeViewController.swift
//  ScreenOrientations
//
//  Created by ucredit-XiaoYang on 2017/7/19.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

import UIKit

class PresentLandscapeViewController: BaseViewController {
    
    var isPortrait: Bool = true
    
    public convenience init(portrait: Bool) {
        self.init()
        
        isPortrait = portrait
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let back = UIButton(type: .custom)
        back.setTitle("back", for: .normal)
        back.backgroundColor = UIColor.orange
        back.frame = CGRect.init(x: 60, y: 20, width: 80, height: 40)
        view.addSubview(back)
        
        back.addTarget(self, action: #selector(callback), for: .touchUpInside)
        
    }
    
    
    func callback() {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


extension PresentLandscapeViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return isPortrait ? .portrait : .landscapeLeft
    }

    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return isPortrait ? .portrait : .landscapeLeft
    }
    
}
