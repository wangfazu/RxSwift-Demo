//
//  Moya_me.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/5/11.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import Foundation
import Moya

public enum DouBan{
    case channels
    case playlist(String)
}
let DouBanProvider = MoyaProvider<DouBan>()

extension DouBan: TargetType{
    
    //服务器地址
    public var baseURL: URL {
        switch self {
        case .channels:
            return URL(string: "https://www.douban.com")!
        case .playlist(_):
            return URL(string: "https://douban.fm")!
            
        }
    }
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .channels:
            return "/j/app/radio/channels"
            
        case .playlist(_):
            return "/j/mine/playlist"
        }
    }
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    //这就是左单元测试模拟数据，只会在测试文件中有作用
    public var sampleData: Data {
        return "()".data(using: String.Encoding.utf8)!
    }
    //请求任务
    public var task: Task {
        switch self {
        case .playlist(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    
    
}
