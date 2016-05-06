//
//  NetworkingError.swift
//  TVShows
//
//  Created by Vedran Burojevic on 06/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Foundation

enum NetworkingError: ErrorType {
    case General(NSError)
    case JSONDecoding(NSError)
}
