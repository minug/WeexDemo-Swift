//
//  WXViewController.swift
//  WeexDemo-Swift
//
//  Created by minug on 2019/5/6.
//  Copyright © 2019 minug. All rights reserved.
//

import UIKit
import WeexSDK

public protocol WXViewControllerDelegate:NSObjectProtocol{
    func renderFailed(viewController:WXViewController,error:NSError)
    func renderJSRuntimeException(viewController:WXViewController,jsException:WXJSExceptionInfo)
    func renderFinish(viewController:WXViewController,view:UIView)
    func renderOncreate(viewController:WXViewController,view:UIView)
    
    func stratRender(viewController:WXViewController,url:URL)
}

public class WXViewController: UIViewController {
    var instance : WXSDKInstance?
    public var url:URL?
    public weak var delegate:WXViewControllerDelegate?
    
    public convenience init(url:URL) {
        self.init()
        self.url = url
    }

    func render(url:URL){
        instance?.destroy()
        instance?.rootView?.removeFromSuperview()

        instance = WXSDKInstance()
        instance?.viewController = self
        instance?.frame = view.frame
        weak var weakSelf = self
        instance?.onCreate = {view in
            guard let v = view else {
                return
            }
            if (weakSelf?.delegate != nil ){
                weakSelf?.delegate?.renderOncreate(viewController: weakSelf!, view: view!)
            }
            weakSelf?.view.addSubview(v)
        }
        instance?.onFailed = {error in
            print(error ?? "")
            if (weakSelf?.delegate != nil && error != nil){
                weakSelf?.delegate?.renderFailed(viewController: weakSelf!, error: error! as NSError);
            }
        }
        instance?.onJSRuntimeException = { jsException in
            if(weakSelf?.delegate != nil && jsException != nil){
                weakSelf?.delegate?.renderJSRuntimeException(viewController: weakSelf!, jsException: jsException!);
            }
            print(jsException ?? "")
        }
        instance?.renderFinish = { view in
            
        }
        delegate?.stratRender(viewController: self, url: url);
        instance?.render(with: url)
    }
    @objc public func refresh(){
        guard let u = url else {
            return
        }
        render(url: u);
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        if (self.url != nil){
            let navItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(refresh));
            navigationItem.rightBarButtonItem = navItem
            render(url: url!)
        }
    }

}
