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
            return self.subscribeNext { value in
                guard let successValue = value.value else {
                    return
                }
                onSuccess(successValue)
            }
    }

    func subscribeFailure(onFailure: (E.Error) -> Void)
        -> Disposable {
            return self.subscribeNext { value in
                guard let failureValue = value.error else {
                    return
                }
                onFailure(failureValue)
            }
    }

    func subscribe(onSuccess onSuccess: (E.Value -> Void)? = nil, onFailure: (E.Error -> Void)? = nil,  onError: (ErrorType -> Void)? = nil, onCompleted: (() -> Void)? = nil, onDisposed: (() -> Void)? = nil)
        -> Disposable {

            return subscribe(onNext: { (value) in
                if let successValue = value.value {
                    onSuccess?(successValue)
                } else if let failureValue = value.error {
                    onFailure?(failureValue)
                }
                }, onError: onError, onCompleted: onCompleted, onDisposed: onDisposed)
    }

}
