//
//  APITVShow.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import JASON
import Moya_JASON

private extension JSONKeys {

    static let title  = JSONKey<String>("title")
    static let year   = JSONKey<Int>("year")
    static let ids    = JSONKey<JSON>("ids")
    static let images = JSONKey<JSON>("images")
    
}

struct APITVShow: Mappable {

    let title: String
    let year: Int
    let ids: APITVShowIdentifier
    let images: APIImages

    init(_ json: JSON) throws {

        title = json[.title]
        year  = json[.year]
        ids   = try! APITVShowIdentifier(json[.ids])
        images  = try! APIImages(json[.images])

    }

}
