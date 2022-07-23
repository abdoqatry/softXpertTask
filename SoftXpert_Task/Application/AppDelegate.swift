//
//  AppDelegate.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        startFlow()
        return true
    }

    func startFlow() {
//        let vc = RecipeeConfigurator.asymble(type: .listView)
        let vc = Bundle.main.loadNibNamed("ChartVC", owner: nil, options: nil)![0] as! ChartVC
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }


}

