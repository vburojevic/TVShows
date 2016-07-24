//
//  APITVShowIdentifier.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Gloss
import Moya_Gloss

struct APITVShowIdentifier {

    let trakt: String?
    let slug: String?
    let tvdb: String?
    let imdb: String?
    let tmdb: String?
    let tvrage: String?

}

extension APITVShowIdentifier: Decodable {

    init(json: JSON) {
        self.trakt = "trakt" <~~ json
        self.slug = "slug" <~~ json
        self.tvdb = "tvdb" <~~ json
        self.imdb = "imdb" <~~ json
        self.tmdb = "tmdb" <~~ json
        self.tvrage = "tvrage" <~~ json
    }
    
}
