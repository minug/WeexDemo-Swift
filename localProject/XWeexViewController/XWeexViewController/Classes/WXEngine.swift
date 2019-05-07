//
//  WXEngine.swift
//  WeexDemo-Swift
//
//  Created by minug on 2019/5/6.
//  Copyright © 2019 minug. All rights reserved.
//

import UIKit
import WeexSDK
public class WXEngine{
    static public func start(){
        
        WXAppConfiguration.setAppName("SimpleWeexDemo")
        WXAppConfiguration.setAppGroup("Minug")
        WXAppConfiguration.setAppVersion("1.0.0")
        WXSDKEngine.initSDKEnvironment()
    }
}
