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

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        application.beginReceivingRemoteControlEvents()
        return true
    }

    // MARK: UISceneSession Lifecycle

    override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            //register event
            ShadhinBL.shared.eventRegister(with: event)
            
        }
    }

}

extension AppDelegate : ShadhinCoreNotifier{
    func memberShipStatus(isValid: Bool, value: String) {
        print("\(isValid) \(value)")
    }

    func linkRedirect(link: String) {
        
    }
    
    func event(eventName: String, content: [String : String]) {
        
    }
    
    func shareContentWithRC(title: String, image: String, rc code: String) {
        
    }
    
    func bkashPaymentInit() {
        
    }
    
    func bksahPaymentSuccess() {
        print("Payment success")
    }
    
    func player(error: String) {
        print(error)
    }
    
    func rcError(error: String?) {
        print(error as Any)
    }
    
    func amarTuneError(error: String?) {
        print(error as Any)
    }
    
    func patchError(error: String) {
        print(error)
    }
    
    func tokenStatus(token isValid: Bool, error: String?) {
        print(error as Any)
    }
    func shareContentWithRC(rc code: String) {
        print(code)
    }
}
