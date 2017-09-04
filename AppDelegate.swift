//
//  AppDelegate.swift
//  NetFlix
//
//  Created by Diego Go on 8/27/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //aqui vou pegar toda a tela
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let feedVC =  feedMovieViewController(style: UITableViewStyle.grouped)
        let navVC = UINavigationController(rootViewController: feedVC)
        
        window?.rootViewController = navVC
        
        
        //aqui mostro minha tela
        window?.makeKeyAndVisible()
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

extension UIColor {
    static func fromHex(value: UInt32) -> UIColor{
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(value & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    static func fromHex(value: UInt32, alpha: CGFloat) -> UIColor{
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(value & 0x0000FF) / 255.0
        let a = alpha
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}



extension UIView {
    func cons(pattern:String, views:UIView...){
        
        var mViews: [String : UIView] = [:]
        
        for (index, view) in views.enumerated(){
            
            view.translatesAutoresizingMaskIntoConstraints = false
            mViews["v\(index)"] = view
        }
        
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: pattern,
                                                     options: NSLayoutFormatOptions(),
                                                     metrics: nil,
                                                     views: mViews))

    }
}


