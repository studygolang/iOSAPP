//
//  YYNetworkTool.swift
//  YY
//
//  Created by Mac on 2017/4/26.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class SGRequestModel:NSObject,Mappable {
    var code:String = "0"
    var data:Any?
    var msg:String = ""
    required init?(map: Map) {
        print(map.JSON)
    }
    func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        msg <- map["msg"]
    }
    
    func isError() -> Bool {
        var state = true
        if self.data != nil {
            state = false
        } else {
            let s1 = String.init(format: "request err , code = %d , msg = %@", self.code,self.msg)
            MyLog(s1)
        }
        return state
    }
     override var description: String {
        let s1 = String.init(format: "self.code - %@, self.data - %@,self.msg - %@", code,data as! CVarArg,msg)
        return s1
    }
    
    
}

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
    public typealias failClosure = (_ comp:Error?) ->Void
    public typealias compCls = (_ response:SGRequestModel?, _ err:Error?) -> Void

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
    
    public class func getHttp(url:String , par:[String:Any]?, succ:succClosure?, fail:failClosure?) {
        let manager = YYNetworkTool.netWorkManager
        let res = manager.request(url, method:.get, parameters: par, encoding: URLEncoding.default, headers: YYNetworkTool.headers)
        res.responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess && succ != nil {
                succ!(response.result.value)
            } else {
                fail!(response.error)
            }
            YYNetworkTool.printLog(url: url, par: par, err: (response.error))
        }
    }
    
    public class func postHttp(url:String , par:[String:Any]?, succ:succClosure?, fail:failClosure?) {
        let manager = YYNetworkTool.netWorkManager
        let res = manager.request(url, method:.post, parameters: par, encoding: URLEncoding.default, headers: YYNetworkTool.headers)
        res.responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess && succ != nil {
                succ!(response.result.value)
            } else {
                fail!(response.error)
            }
            YYNetworkTool.printLog(url: url, par: par, err: response.error)
        }
    }
    
    public class func httpRequest(type:HTTPMethod,url:String,par:[String:Any]?, comp:@escaping compCls) {
        let manager = YYNetworkTool.netWorkManager
        let res = manager.request(url, method:type, parameters: par, encoding: URLEncoding.default, headers: YYNetworkTool.headers)
        res.responseJSON { (response:DataResponse<Any>) in
            if response.result.isSuccess && response.result.value != nil{
                let d1 = response.result.value as! [String:Any]
                let model =  SGRequestModel(JSON:d1)
                if model != nil && model?.isError() == false {
                    comp(model,nil)
                 }
            } else {
                comp(nil,response.error)
            }
            YYNetworkTool.printLog(url: url, par: par, err: response.error)
        }
    }
    
    private class func printLog(url:String , par:[String:Any]? = nil,err:Error? = nil) {
        if par != nil {
            let s1 = String.init(format: "request par %@",par!)
            MyLog(s1)
        }
         if err != nil {
            let s2 = String.init(format: "request err %@",err! as CVarArg)
            MyLog(s2)
        }
        print("request url - ",url)
    }
}

