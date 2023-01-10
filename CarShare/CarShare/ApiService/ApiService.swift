//
//  ApiService.swift
//  CarShare
//
//  Created by chetuan on 2022/10/14.
//

import Foundation
import Alamofire
class ApiService: NSObject {
    var Session: Alamofire.Session?
    let sessionConfig = URLSessionConfiguration.default
    public func request( parameters : NSDictionary , _ convertible: URLConvertible,headers:HTTPHeaders) -> Void {
        sessionConfig.timeoutIntervalForRequest = 30
        Session = Alamofire.Session(configuration: sessionConfig)
        
//        struct HTTPBinResponse: Decodable { let url: String }
//        AF.request("https://httpbin.org/get",parameters: <#T##Parameters?#>).responseDecodable(of: HTTPBinResponse.self) { response in
//            debugPrint("Response: \(response)")
//        }
    }
    func makeLogon() {
        // 构建URL
        let url:URL = URL(string: "http://192.168.101.78:8022/carSpu/carSpuList")!
        // 发送HTTP请求的的session对象
        let session = URLSession.shared
        // 构建请求request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // 发一个get请求
        let task:URLSessionDataTask = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            let dict = self.getDictionaryFromJSONString(jsonString: dataString!)
            print(dict)
        }
        task.resume()
    }

    public func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    
}

