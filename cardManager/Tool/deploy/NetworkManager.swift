//
//  NetworkManager.swift
//  cardManager
//
//  Created by style强 on 2018/12/4.
//  Copyright © 2018 style强. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON

// 超时时长
private var requestTimeOut:Double = 30
//成功数据的回调
typealias successCallback = ((JSON) -> (Void))
//失败的回调
typealias failedCallback = ((MoyaError) -> (Void))

//网络请求的基本设置,这里可以拿到是具体的哪个网络请求，可以在这里做一些设置
private let myEndpointClosure = { (target: MoyaApi) -> Endpoint in
    //这里把endpoint重新构造一遍主要为了解决网络请求地址里面含有? 时无法解析的bug https://github.com/Moya/Moya/issues/1198
    let url = target.baseURL.absoluteString + target.path
    var task = target.task
    
    /*
     如果需要在每个请求中都添加类似token参数的参数请取消注释下面代码
     👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇
     */
    //    let additionalParameters = ["token":"888888"]
    //    let defaultEncoding = URLEncoding.default
    //    switch target.task {
    //        ///在你需要添加的请求方式中做修改就行，不用的case 可以删掉。。
    //    case .requestPlain:
    //        task = .requestParameters(parameters: additionalParameters, encoding: defaultEncoding)
    //    case .requestParameters(var parameters, let encoding):
    //        additionalParameters.forEach { parameters[$0.key] = $0.value }
    //        task = .requestParameters(parameters: parameters, encoding: encoding)
    //    default:
    //        break
    //    }
    /*
     👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆👆
     如果需要在每个请求中都添加类似token参数的参数请取消注释上面代码
     */
    
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: task,
        httpHeaderFields: target.headers
    )
    //每次请求都会调用endpointClosure 到这里设置超时时长 也可单独每个接口设置
    requestTimeOut = 30
    return endpoint
/**
    switch target {
    case .easyRequset:
        return endpoint
    case .register:
        requestTimeOut = 5
        return endpoint

    default:
        return endpoint
    }
 */
}

//网络请求的设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeOut
        // 打印请求参数
        if let requestData = request.httpBody {
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

//NetworkActivityPlugin插件用来监听网络请求，界面上做相应的展示
//但这里我没怎么用这个。。。 loading的逻辑直接放在网络处理里面了
private let networkPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
    print("networkPlugin \(changeType)")
    switch(changeType){
    case .began:
        print("开始请求网络,这里可以写加载框")
    case .ended:
        print("结束，这里可以结束加载框")
    }
}

///网络请求发送的核心初始化方法，创建网络请求对象
let Provider = MoyaProvider<MoyaApi>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)

// - Parameters:
//   - target: 网络请求
//   - completion: 成功
//   - failed: 失败
func NetWorkRequest(_ target: MoyaApi, completion: @escaping successCallback , failed:@escaping failedCallback) {
    //先判断网络是否有链接 没有的话直接返回--代码略
    if !isNetworkConnect{
        //print("提示用户网络似乎出现了问题")
        return
    }
    //这里显示loading图
    Provider.request(target) { (result) in
        //隐藏hud
        switch result {
        case let .success(response):
            do {
                var resultJson = try JSON(data: response.data)
                if resultJson["encrypt"].number == 1{//data数据被加密了
                    if resultJson["data"].string == nil {
                        completion(resultJson)
                    }else {
        
                        let needDeEncryptString = resultJson["data"].string
                        let decryptString:String? = needDeEncryptString?.three3DESDeEncrypt()
                        let convertData = JSON(parseJSON: decryptString ?? "")
                        resultJson["data"] = convertData
                        completion(resultJson)
            
                    }
                }else {
                     completion(resultJson)
                }
            } catch {
                let error = NSError(domain: "", code: 0, userInfo: nil)
                failed(error as! MoyaError)
            }
        case let .failure(error):
            failed(error)
        }
    }
}

// 基于Alamofire,网络是否连接，，这个方法不建议放到这个类中,可以放在全局的工具类中判断网络链接情况
// 用get方法是因为这样才会在获取isNetworkConnect时实时判断网络链接请求，如有更好的方法可以fork
var isNetworkConnect: Bool {
    get{
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true //无返回就默认网络已连接
    }
}











