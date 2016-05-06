//
//  Progressable.swift
//  TVShows
//
//  Created by Vedran Burojevic on 5/4/16
//  Copyright (c) 2016 1337code. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol Progressable {
    func showLoading()
    func hideLoading()
}

extension Progressable where Self: UIViewController {

    func showLoading() {
        if self.isKindOfClass(UITableViewController) {
            MBProgressHUD.showHUDAddedTo(self.navigationController?.view ?? self.view, animated: true)
        } else {
            MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        }
    }

    func hideLoading() {
        if self.isKindOfClass(UITableViewController) {
            MBProgressHUD.hideHUDForView(self.navigationController?.view ?? self.view, animated: true)
        } else {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
        }
    }

}
