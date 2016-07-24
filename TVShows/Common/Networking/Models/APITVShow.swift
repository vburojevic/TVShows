//
//  APITVShow.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Gloss
import Moya_Gloss

struct APITVShow {

    let title: String
    let year: Int?
    let ids: APITVShowIdentifier?
    let images: APIImages?
    
}

extension APITVShow: Decodable {

    init?(json: JSON) {
        guard let title: String = "title" <~~ json else {
            return nil
        }

        self.title = title
        self.ids = "ids" <~~ json
        self.year = "year" <~~ json
        self.images = "images" <~~ json
    }

}
