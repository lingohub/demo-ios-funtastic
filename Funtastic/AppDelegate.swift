//
//  AppDelegate.swift
//  Funtastic
//
//  Created by Martin Daum on 15.07.20.
//

import UIKit
import LingoHub

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        LingoHubSDK.shared.configure(withApiKey: Constants.LingoHub.authToken, projectId: Constants.LingoHub.projectId)
        LingoHubSDK.shared.swizzleMainBundle()
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        LingoHubSDK.shared.update { result in
            switch result {
            case .success(let value):
                print("Content updated: \(value)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
