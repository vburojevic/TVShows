//
//  AppDelegate.swift
//  TVShows
//
//  Created by Vedran Burojevic on 5/4/16
//  Copyright (c) 2016 1337code. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        let wireframe = PopularTVShowsWireframe()
        let popularTVShowsViewController = wireframe.instantiateAndConfigureModule()
        let navigationController = UINavigationController(rootViewController: popularTVShowsViewController)
        window?.rootViewController = navigationController

        return true
    }

}
