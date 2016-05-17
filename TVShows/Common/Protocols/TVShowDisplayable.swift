//
//  TVShowDisplayable.swift
//  TVShows
//
//  Created by Vedran Burojevic on 17/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Foundation

protocol TVShowDisplayable {
    var title: String { get }
    var imageURL: NSURL? { get }
}
