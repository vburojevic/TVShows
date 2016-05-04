//
//  APITVShowIdentifier.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import JASON
import Moya_JASON

private extension JSONKeys {

    static let trakt  = JSONKey<Int>("trakt")
    static let slug   = JSONKey<String>("slug")
    static let tvdb   = JSONKey<Int?>("tvdb")
    static let imdb   = JSONKey<String?>("imdb")
    static let tmdb   = JSONKey<Int?>("tmdb")
    static let tvrage = JSONKey<Int?>("tvrage")

}

struct APITVShowIdentifier: Mappable {

    let trakt: Int
    let slug: String
    let tvdb: Int?
    let imdb: String?
    let tmdb: Int?
    let tvrage: Int?

    init(_ json: JSON) throws {

        trakt  = json[.trakt]
        slug   = json[.slug]
        tvdb   = json[.tvdb]
        imdb   = json[.imdb]
        tmdb   = json[.tmdb]
        tvrage = json[.tvrage]
        
    }

}
