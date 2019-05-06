//
//  WXViewController.swift
//  WeexDemo-Swift
//
//  Created by minug on 2019/5/6.
//  Copyright © 2019 minug. All rights reserved.
//

import UIKit

class WXViewController: UIViewController {
    var instance : WXSDKInstance?
    var url:URL?;
    
    func render(url:URL){
        instance?.destroy()
        instance?.rootView.removeFromSuperview()
        
        instance = WXSDKInstance()
        instance?.viewController = self
        instance?.frame = view.frame
        weak var weakSelf = self
        instance?.onCreate = {view in
            
            guard let v = view else {
                return
            }
            weakSelf?.view.addSubview(v)
        }
        instance?.onFailed = {error in
            print(error ?? "")
        }
        instance?.onJSRuntimeException = { exception in
            print(exception ?? "")
        }
        instance?.renderFinish = { view in
            
        }
        instance?.render(with: url)
    }
    @objc func refreshClick(item:UIBarButtonItem){
        guard let u = url else {
            return
        }
        render(url: u);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let navItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(refreshClick(item:)));
        navigationItem.rightBarButtonItem = navItem
        url = URL(string: "http://localhost:8081/dist/index.js")
        render(url: url!)
    }
    
}
