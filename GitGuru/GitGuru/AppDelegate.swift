//
//  AppDelegate.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 01/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard granted else {return}
            self.notificationCenter.getNotificationSettings { (settings) in
                print(settings)
                guard settings.authorizationStatus == .authorized else {return}
            }
        }
        notificationCenter.delegate = self
        sendNotification()
        return true
    }
    func sendNotification() {
// MARK: - Use UNMutableNotificationContent not UNNotificationContent if you want to change content
        let content = UNMutableNotificationContent()
        content.title = "First Notification"
        content.body = "My first notification"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            print(error?.localizedDescription)
        }
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


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification:
        UNNotification, withCompletionHandler completionHandler: @escaping
        (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
        print (#function)
}
 // MARK: Managing user actions when clicking on a notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response:
        UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print (#function)
    }
}
