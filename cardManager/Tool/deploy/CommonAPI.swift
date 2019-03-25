//
//  CommonAPI.swift
//  cardManager
//
//  Created by style强 on 2018/11/25.
//  Copyright © 2018 style强. All rights reserved.
//

import Foundation
import Moya

let NETWORK_BASE1 = "https://apis.dpyesir.cn/index.php"
//幻灯片
let HomeFlash = "/first/flash"

//注意事项：使用枚举值时，需要区分是String类型，还是Int类型，String类型时取值使用rawValue，Int类型时取值使用hashValue。
public enum MoyaApi {
    case loginPort(parameters:[String:Any])
    case uploadImage(parameters:[String:Any],imageData:Data)
    case flashPort
    case jiaZhuangPort
    case channlPort
    case boutiqueListPort
}

extension MoyaApi:TargetType {
    
    //服务器地址
    public var baseURL:URL {
        switch self {
        case .channlPort:
            return URL(string: "https://www.douban.com")!
        case .boutiqueListPort:
            return URL(string: "http://app.u17.com/v3/appV3_3/ios/phone")!
        default:
            return URL(string: NETWORK_BASE1)!
        }
    }
    
    //各个网络请求的具体路径
    public var path:String {        switch self {
    case .flashPort:
        return HomeFlash
    case .loginPort(_):
        return "/user/login"
    case .jiaZhuangPort:
        return "/goods/weex_pro_lists_jz"
    case .channlPort:
        return "/j/app/radio/channels"
    case .boutiqueListPort:
        return "comic/boutiqueListNew"
    case .uploadImage(_ , _):
        return ""
        }
    }
    
    //请求类型
    public var method:Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    //请求任务事件
    public var task:Task {
        var fixedParmeters = ["app":"1",
                              "version":Bundle.main.infoDictionary!["CFBundleShortVersionString"]!]
        switch self {
        case .loginPort(let parameters):
            for(key,value) in parameters {
                fixedParmeters[key] = value
            }
            let para:[String:Any] = GlobalFunctionTool.netWorkConvertDict(dictionry: fixedParmeters)
            return .requestParameters(parameters: para, encoding: URLEncoding.default)
        default:
            let para:[String:Any] = GlobalFunctionTool.netWorkConvertDict(dictionry: fixedParmeters)
            return .requestParameters(parameters: para, encoding: URLEncoding.default)
        }
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData:Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String : String]?{
        return nil
        
    }
    
}

