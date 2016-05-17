//
//  APIImages.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import JASON
import Moya_JASON

private extension JSONKeys {
    static let fanArt   = JSONKey<JSON>("fanart")
    static let poster   = JSONKey<JSON>("poster")
    static let logo     = JSONKey<JSON>("logo")
    static let clearArt = JSONKey<JSON>("clearart")
    static let banner   = JSONKey<JSON>("banner")
    static let thumb    = JSONKey<JSON>("thumb")
}

struct APIImages: Mappable {

    let fanArt: APIImage
    let poster: APIImage
    let logo: APIImage
    let clearArt: APIImage
    let banner: APIImage
    let thumb: APIImage

    init(_ json: JSON) throws {
        fanArt   = try! APIImage(json[.fanArt])
        poster   = try! APIImage(json[.poster])
        logo     = try! APIImage(json[.logo])
        clearArt = try! APIImage(json[.clearArt])
        banner   = try! APIImage(json[.banner])
        thumb    = try! APIImage(json[.thumb])
    }
}
