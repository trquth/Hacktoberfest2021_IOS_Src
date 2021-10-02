//
//  Client.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import UIKit
import Alamofire

class Client : NSObject {
    
    static let shareInstance = Client()
    
    func makeRequest(_ url: String,_ httpMethod: HTTPMethod, _ headers: HTTPHeaders,_ params: [String: AnyObject],_ completion: @escaping (_ result: AnyObject?, _ error : NSError?) -> ()) {
//        func sendError(_ error: String) {
//            print("\(url) \(httpMethod.rawValue) ERROR 🙁🙁🙁🙁🙁 \(error)")
//            completion(nil, NSError(domain: "makeRequestMethod", code: 1, userInfo: [NSLocalizedDescriptionKey: error]))
//        }
//        
//        AF.request(url, method: httpMethod, parameters: params, encoding: URLEncoding.httpBody, headers: headers).validate().responseJSON { (response: DataResponse<Any>) in
//            switch response.result {
//                case .success(_):
//                    if let data = response.result.value as? Dictionary<String,Any> {
//                        completion(data as AnyObject?, nil)
//                    }else{
//                        completion(nil, NSError(domain: "responseMessage", code: 1))
//                    }
//                    break
//                case .failure(let error):
//                    sendError(error.localizedDescription)
//                
//            }
//        }
    }
    
}
