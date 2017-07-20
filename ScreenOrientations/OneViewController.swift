//
//  HYOrientationViewController.swift
//  ScreenOrientations
//
//  Created by ucredit-XiaoYang on 2017/7/19.
//  Copyright © 2017年 XiaoYang. All rights reserved.
//

import UIKit


class OneViewController: BaseViewController {
    
    let height = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
    let width = min(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
    
    
    var table: UITableView?
    
    var isPortrait: Bool = true
    var isStatusBarPortrait: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView(frame: view.bounds, style: .plain)
        table?.rowHeight = 44
        table?.tableFooterView = UIView()
        table?.dataSource = self
        table?.delegate = self
        view.addSubview(table!)
        table?.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "oro"), style: .plain, target: self, action: #selector(changeOrientation))
        navigationItem.rightBarButtonItem = rightItem
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleStatusBarOrientationChange(_:)), name: .UIApplicationDidChangeStatusBarOrientation, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .UIApplicationDidChangeStatusBarOrientation, object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func changeOrientation() {
        
        if isPortrait {
            isStatusBarPortrait = false
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
            UIApplication.shared.statusBarOrientation = .landscapeLeft
        }
        else {
            isStatusBarPortrait = true
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UIApplication.shared.statusBarOrientation = .portrait
        }
        
    }
    
    
    /// 监听屏幕旋转状态，可以在这里处理详细的页面布局逻辑
    func handleStatusBarOrientationChange(_ userInfo: NSNotification) {
        
        let interfaceOrientation = UIApplication.shared.statusBarOrientation
        
        switch interfaceOrientation {
            
        case .portrait, .unknown, .portraitUpsideDown:
            table?.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
            isPortrait = true
            
        case .landscapeRight, .landscapeLeft:
            table?.frame = CGRect.init(x: 0, y: 0, width: height, height: width)
            isPortrait = false
            
        }
     
    }

}



extension OneViewController {
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return isStatusBarPortrait ? .portrait : .landscapeLeft
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return isStatusBarPortrait ? .portrait : .landscapeLeft
    }
    
}


extension OneViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel?.text = "row is \(indexPath.row)"
        cell.backgroundColor = indexPath.row % 2 == 0 ? .groupTableViewBackground : .gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            let VC = PushLandscapeViewController(portrait: isStatusBarPortrait)
            self.navigationController?.pushViewController(VC, animated: true)
        } else {
            let VC = PresentLandscapeViewController(portrait: isStatusBarPortrait)
            self.present(VC, animated: true, completion: nil)
        }
        
    }
    
}
