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
            .mapArray(APITVShow.self)
            .subscribe { event in
                switch event {
                case .Next(let tvShows):
                    print("\n\nTV SHOWS: \(tvShows)")
                case .Error(let error):
                    print(error)
                default: break
                }
            }
            .addDisposableTo(rx_disposeBag)

        return true
    }

}
