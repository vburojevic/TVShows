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

    var title: String {
        switch self {
        case .General:
            return "General error"
        case .JSONDecoding:
            return "JSON decoding error"
        }
    }

    var message: String {
        switch self {
        case .General(let error):
            return error.localizedDescription
        case .JSONDecoding(let error):
            return error.localizedDescription
        }
    }
}
