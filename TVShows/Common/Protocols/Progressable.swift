//
//  Progressable.swift
//  TVShows
//
//  Created by Vedran Burojevic on 5/4/16
//  Copyright (c) 2016 1337code. All rights reserved.
//

import UIKit

protocol Progressable {
    func showLoading()
    func hideLoading()
}

extension Progressable where Self: UIViewController {
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
    
}
