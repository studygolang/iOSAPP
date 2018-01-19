//
//  YYNetworkTool.swift
//  YY
//
//  Created by Mac on 2017/4/26.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Alamofire

class YYNetworkTool: NSObject {

    public static let netWorkManager: SessionManager = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = TimeInterval(15.0)
        config.httpAdditionalHeaders = YYNetworkTool.headers
        let manager = Alamofire.SessionManager(configuration: config)
        return manager
    }()
    
    enum NetWorkType {
        case unknowable
        case wifi
        case wwan
    }
    
    public typealias netStateClosure = (_ state:NetWorkType) ->Void
    public typealias  succClosure = (_ comp:Any?) -> Void
    public typealias failClosure = (_ fail:Error?) ->Void

    private static let headers: [String:String] = {
        var headers = SessionManager.defaultHTTPHeaders
        headers["Content-Type"] = "application/json,text/json,text/javascript,text/html,text/plain,text/xml,video/mp2t,suggestion/json"
        return headers
    }()
    
    public class func httpState(net:@escaping netStateClosure) {
        let listen = NetworkReachabilityManager.init(host: "https://www.baidu.com")
        listen?.startListening()
        listen?.listener = { status in
            if listen?.isReachable == false {
                net(.unknowable)
            }
            if status == NetworkReachabilityManager.NetworkReachabilityStatus.reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi) {
                net(.wifi)
            }
            else {
                net(.wwan)
            }
        }
    }
    
    public class func getHttp(url:String , par:[String:Any]? , succ:@escaping succClosure, fail:@escaping failClosure) {
        let manager = YYNetworkTool.netWorkManager
        let res = manager.request(url, method:.get, parameters: par, encoding: URLEncoding.default, headers: YYNetworkTool.headers)
        res.responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess
            {
                succ(response.result.value)
            }
            else
            {
                if response.result.error != nil
                {
                    fail(response.result.error)
                }
            }
        }
    }
    
    public class func postHttp(url:String , par:[String:Any],succ:@escaping succClosure , fail:@escaping failClosure) {
        let manager = YYNetworkTool.netWorkManager
        manager.request(url, method: .post, parameters: par, encoding: JSONEncoding.default, headers: YYNetworkTool.headers).responseJSON { response in
            if response.result.isSuccess
            {
                succ(response.result.value)
            }
            if response.error != nil
            {
                fail(response.error)
            }
        }
    }
}

