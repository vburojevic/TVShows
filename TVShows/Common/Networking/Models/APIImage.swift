//
//  APIImage.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import JASON
import Moya_JASON

private extension JSONKeys {

    static let full   = JSONKey<String>("full")
    static let medium = JSONKey<String?>("medium")
    static let thumb  = JSONKey<String?>("thumb")

}

struct APIImage: Mappable {

    let full: String
    let medium: String?
    let thumb: String?

    init(_ json: JSON) throws {

        full   = json[.full]
        medium = json[.medium]
        thumb  = json[.thumb]

    }

}
