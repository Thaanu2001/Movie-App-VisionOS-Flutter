//
//  FlutterUtils.swift
//  native_movie_app
//
//  Created by Thaanu Perera on 2023-06-26.
//

import Foundation
import UIKit
import Flutter

class FlutterUtils:NSObject{
    static let shared = FlutterUtils()
    
    var methodChannel : FlutterMethodChannel?
    var mainView: UIViewController?
    var isLoginSuccess: Bool = false
    
    // Make sure the class has only one instance
    // Should not init or copy outside
    private override init() {
        super.init()
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            launchChatFunc()
//            methodChannel = FlutterMethodChannel(name: "com.tencent.chat/add-to-ios",
//                                                 binaryMessenger: flutterEngine.binaryMessenger)
//            methodChannel?.setMethodCallHandler({ [weak self]
//                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//                if let strongSelf = self {
//                    switch(call.method) {
//                    case "launchChat":
//                        strongSelf.launchChatFunc()
//                    default:
//                        print("Unrecognized method name: \(call.method)")
//                    }
//                }
//            })
        }
    }
    
    func initViewController(mainViewController: UIViewController){
        self.mainView = mainViewController
    }
    
    func launchChatFunc(){
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            print("awaa")
            if(flutterEngine.viewController == nil){
                let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
                mainView?.present(flutterViewController, animated: true, completion: nil)
            }
        }
    }
}
