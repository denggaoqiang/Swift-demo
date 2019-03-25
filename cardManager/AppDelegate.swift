//
//  AppDelegate.swift
//  cardManager
//
//  Created by style强 on 2018/11/21.
//  Copyright © 2018 style强. All rights reserved.
//

////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| ^_^ |)                              //
//                         O\  =  /O                              //
//                      ____/`---'\____                           //
//                    .'  \\|     |//  `.                         //
//                   /  \\|||  :  |||//  \                        //
//                  /  _||||| -:- |||||-  \                       //
//                  |   | \\\  -  /// |   |                       //
//                  | \_|  ''\---/''  |   |                       //
//                  \  .-\__  `-`  ___/-. /                       //
//                ___`. .'  /--.--\  `. . ___                     //
//              ."" '<  `.___\_<|>_/___.'  >'"".                  //
//            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
//            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
//      ========`-.____`-.___\_____/___.-`____.-'========         //
//                           `=---='                              //
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
//         佛祖保佑            永无BUG              永不修改         //
////////////////////////////////////////////////////////////////////

import UIKit
import Alamofire
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 1.0);
        window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height));
        window?.backgroundColor = UIColor.white;
        let tab = self.customIrregularityStyle(delegate: self as? UITabBarControllerDelegate)
        window?.rootViewController = tab
        window?.makeKeyAndVisible();
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
        let tabBarController = ESTabBarController()
        if let tabBar = tabBarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        
        let homeVC = HomeViewController.init()
        homeVC.title = "首页"
        homeVC.view.backgroundColor = UIColor.white
        let shopCartVC = ShoppingCartViewController.init()
        shopCartVC.title = "购物车"
        let centerVC = CenterViewController.init()
        centerVC.title = "个人中心"
        centerVC.view.backgroundColor = UIColor.white
        
        homeVC.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        shopCartVC.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "购物车", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        centerVC.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "个人中心", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        let n1 = BaseNavigationViewController.init(rootViewController: homeVC)
        let n2 = BaseNavigationViewController.init(rootViewController: shopCartVC)
        let n3 = BaseNavigationViewController.init(rootViewController: centerVC)
        tabBarController.viewControllers = [n1, n2, n3]
        if let tabBarItem = shopCartVC.tabBarItem as? ESTabBarItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                tabBarItem.badgeValue = "1"
            }
        }
       return tabBarController
    }
    
}

