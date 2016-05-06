//
//  ObservableType+Result.swift
//  TVShows
//
//  Created by Vedran Burojevic on 05/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Foundation
import RxSwift
import Result

extension ObservableType where E: ResultType {

    func doOnSuccess(onSuccess: (E.Value throws -> Void))
        -> Observable<E> {
            return self.doOnNext { (value) in
                guard let successValue = value.value else {
                    return
                }
                try onSuccess(successValue)
            }
    }

    func doOnFailure(onFailure: (E.Error throws -> Void))
        -> Observable<E> {
            return self.doOnNext { (value) in
                guard let failureValue = value.error else {
                    return
                }
                try onFailure(failureValue)
            }
    }

    func subscribeSuccess(onSuccess: (E.Value) -> Void)
        -> Disposable {
            return self.subscribeNext({ _ in
                self.doOnSuccess({ (value) in
                    onSuccess(value)
                })
            })
    }

    func subscribeFailure(onFailure: (E.Error) -> Void)
        -> Disposable {
            return self.subscribeNext({ _ in
                self.doOnFailure({ (value) in
                    onFailure(value)
                })
            })
    }

}
