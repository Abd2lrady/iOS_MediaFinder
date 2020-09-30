//
//  AppDelegate.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/3/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let userData = UserDefaultData.createSharedInstance()
        // Create Main StoryBoard
        // Using it to change the staring viewcontroller
        let mainStoryBoard = UIStoryboard(name: StoryBoard_C.main, bundle: nil)
        var navigationController = UINavigationController(rootViewController: mainStoryBoard.instantiateViewController(withIdentifier: ViewController_C.signUp))
        if  userData.isLogged ?? false {
            // set initial viewcontroller to Profile viewcontroller
            let initialVC = mainStoryBoard.instantiateViewController(withIdentifier: ViewController_C.profile) as! profileVC
            navigationController = UINavigationController(rootViewController: initialVC)

        }
        else if userData.isRegistered ?? false{
            // set intial viewcontoller To Sign in viewcontroller
            let initialVC = mainStoryBoard.instantiateViewController(withIdentifier: ViewController_C.signIn) as! signInVC
            navigationController = UINavigationController(rootViewController: initialVC)

        }
        
        self.window?.rootViewController = navigationController
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

