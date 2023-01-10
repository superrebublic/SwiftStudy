//
//  HomeApi.swift
//  CarShare
//
//  Created by chetuan on 2022/11/23.
//

import Foundation
import Moya

let HomeApiAPIProvider = MoyaProvider<HomeAPI>()

public enum HomeAPI{
    case homeList(homedata :Dictionary<String, Any>)
}

extension HomeAPI :TargetType{
    public var headers: [String : String]? {
        return nil
    }
    
    public var baseURL: URL{
        switch self{
        case .homeList:
            return URL(string: "http://192.168.101.78:8022")!
        }
        
    }
    public var path: String {
        switch self{
        case .homeList:
            return "/carSpu/carSpuList"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .homeList(let homedata):
            let parameters = homedata
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}
