//
//  AppDelegate.swift
//  WeexDemo-Swift
//
//  Created by minug on 2019/5/6.
//  Copyright © 2019 minug. All rights reserved.
//

import UIKit
import XWeexViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WXViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let fileURL = URL(string: "http://localhost:8081/dist/index.js");
        if (fileURL != nil){
            let wxVC = WXViewController(url: fileURL!)
            wxVC.delegate = self
            let navController = UINavigationController(rootViewController: wxVC)
            window?.rootViewController = navController
        }
        window?.makeKeyAndVisible()

        WXEngine.start()
        return true
    }
    
    func renderFailed(viewController: WXViewController, error: NSError) {
        if (error.domain == WX_ERROR_DOMAIN){
            let indexJSURL = Bundle.main.url(forResource: "index", withExtension: "js")
            if (indexJSURL != nil){
                viewController.url = indexJSURL
                viewController.refresh()
            }
        }
    }
    
    func renderOncreate(viewController: WXViewController, view: UIView) {
        
    }
    
    func renderFinish(viewController: WXViewController, view: UIView) {
        
    }
    
    func renderJSRuntimeException(viewController: WXViewController, jsException: WXJSExceptionInfo) {
        
    }
    
    func stratRender(viewController: WXViewController, url: URL) {
        
    }
    

}

