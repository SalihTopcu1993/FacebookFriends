//
//  FacebookFriendsServices.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import Moya

enum FacebookFriendsService {
    case list(username: String)
}

let pluginsArray:[PluginType] = [NetworkLoggerPlugin(cURL: true)]
let provider = MoyaProvider<FacebookFriendsService>(plugins: pluginsArray)

extension FacebookFriendsService: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.myjson.com")!
    }

    var path: String {
        switch self {
        case .list(let username):
            return "/bins/" + username
        }
    }

    var method: Moya.Method {
        switch self {
        case .list:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .list:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return nil
    }

}
