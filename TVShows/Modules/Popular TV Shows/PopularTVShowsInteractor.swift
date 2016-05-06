//
//  PopularTVShowsInteractor.swift
//  TVShows
//
//  Created by Vedran Burojevic on 06/05/16.
//  Copyright (c) 2016 1337code. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import Result

final class PopularTVShowsInteractor: NSObject, PopularTVShowsInteractorInterface {
    
    // MARK: - Internal functions -

    func loadPopularTVShows() -> Observable<Result<[APITVShow], NetworkingError>> {
        return TraktTVProvider.request(.PopularTVShows)
            .retry(3)
            .mapArray(APITVShow.self)
            .map { tvShows -> Result<[APITVShow], NetworkingError> in
                return .Success(tvShows)
            }
            .catchError { error -> Observable<Result<[APITVShow], NetworkingError>> in
                return Observable.just(.Failure(NetworkingError.General(error as NSError)))
            }
            .shareReplay(1)
    }

}
