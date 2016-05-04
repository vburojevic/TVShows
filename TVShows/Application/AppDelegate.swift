//
//  AppDelegate.swift
//  TVShows
//
//  Created by Vedran Burojevic on 5/4/16
//  Copyright (c) 2016 1337code. All rights reserved.
//

import UIKit
import RxCocoa
import NSObject_Rx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        TraktTVProvider.request(.PopularTVShows)
            .bindNext { tvShows in
                print("TVShows: \(tvShows)")
            }.addDisposableTo(rx_disposeBag)

        return true
    }

}
