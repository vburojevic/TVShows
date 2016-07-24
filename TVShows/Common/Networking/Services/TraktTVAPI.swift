//
//  TraktTVAPI.swift
//  TVShows
//
//  Created by Vedran Burojevic on 04/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup -

func JSONResponseDataFormatter(data: NSData) -> NSData {
    do {
        let dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        let prettyData =  try NSJSONSerialization.dataWithJSONObject(dataAsJSON, options: .PrettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

let TraktTVProvider = RxMoyaProvider<TraktTVAPI>(endpointClosure: {
    target -> Endpoint<TraktTVAPI> in
    return Endpoint<TraktTVAPI>(URL: target.url,
        sampleResponseClosure: { .NetworkResponse(200, target.sampleData) },
        method: target.method,
        parameters: target.parameters,
        parameterEncoding: target.parameterEncoding,
        httpHeaderFields: target.headers)
    }, plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

enum TraktTVAPI {
    case PopularTVShows(extended: String?)
}

extension TraktTVAPI: TargetType {
    var baseURL: NSURL { return NSURL(string: "https://api-v2launch.trakt.tv")! }

    var path: String {
        switch self {
        case .PopularTVShows:
            return "/shows/popular"
        }
    }

    var url: String {
        return "\(baseURL)\(path).json"
    }

    var method: Moya.Method {
        return .GET
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return method == .GET ? .URL : .JSON
        }
    }

    var headers: [String: String]? {
        return ["trakt-api-version": "2", "trakt-api-key": "8015beda72aa527195cbccb6feff936890bb230b4792ac8bbb5a98f23d883530"]
    }

    var parameters: [String: AnyObject]? {
        switch self {
        case .PopularTVShows(let extended):
            guard let extended = extended else {
                return nil
            }

            return ["extended": extended]
        }
    }

    var sampleData: NSData {
        switch self {
        case .PopularTVShows:
            return "[]".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }

    var multipartBody: [MultipartFormData]? {
        return nil
    }
}

func url(route: TargetType) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
}
