//
//  APIImage.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Gloss
import Moya_Gloss

struct APIImage {

    let full: String?
    let medium: String?
    let thumb: String?

}

extension APIImage: Decodable {

    init(json: JSON) {
        self.full = "full" <~~ json
        self.medium = "medium" <~~ json
        self.thumb = "thumb" <~~ json
    }

}
