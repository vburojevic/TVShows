//
//  TVShowCellItem.swift
//  TVShows
//
//  Created by Vedran Burojevic on 17/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Foundation

struct TVShowCellItem: TVShowDisplayable {

    // MARK: - Public properties -

    let title: String
    let imageURL: NSURL?

    // MARK: - Lifecycle -

    init(tvShow: APITVShow) {
        title = tvShow.title
        imageURL = NSURL(string: tvShow.images.fanArt.full)
    }
}
