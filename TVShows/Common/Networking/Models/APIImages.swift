//
//  APIImages.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Gloss
import Moya_Gloss

struct APIImages {

    let fanArt: APIImage?
    let poster: APIImage?
    let logo: APIImage?
    let clearArt: APIImage?
    let banner: APIImage?
    let thumb: APIImage?
    
}

extension APIImages: Decodable {

    init(json: JSON) {
        self.fanArt = "fanart" <~~ json
        self.poster = "poster" <~~ json
        self.logo = "logo" <~~ json
        self.clearArt = "clearart" <~~ json
        self.banner = "banner" <~~ json
        self.thumb = "thumb" <~~ json
    }
    
}
