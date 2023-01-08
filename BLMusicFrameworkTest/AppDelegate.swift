//
//  AppDelegate.swift
//  BLMusicFrameworkTest
//
//  Created by Joy on 3/1/23.
//

import UIKit
import Shadhin_BL

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        application.beginReceivingRemoteControlEvents()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            //register event
            ShadhinBL.shared.eventRegister(with: event)
            
        }
    }

}

extension AppDelegate : ShadhinCoreNotifier{
    func rcError(error: String?) {
        print(error)
    }
    
    func amarTuneError(error: String?) {
        print(error)
    }
    
    func patchError(error: String) {
        print(error)
    }
    
    func tokenStatus(token isValid: Bool, error: String?) {
        print(error)
    }
    func shareContentWithRC(rc code: String) {
        print(code)
    }
}
