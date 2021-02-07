//
//  WebServiceContract.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import Foundation
import Alamofire


public struct ErrorMessage {
static let unknownAPIError = "Service is currently unavailable."
static let unavailableData = "Data is currently unavailable"
static let unauthenticatedError = "Your session has expired. Please re-login."
}

public typealias WebServiceCompletion = (Result<Data?, Error>) -> Void


protocol WebServiceContract {
    func processService(endPoint:String, completion: @escaping WebServiceCompletion) 

        
}

struct WebService: WebServiceContract {

    func processService(endPoint:String, completion: @escaping WebServiceCompletion) {
    
        AF.request(Constant.baseUrl + endPoint).response { response in
            switch response.result {
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(res))
                        } catch let error {
                            completion(.failure(error))
                        }
                    default:
                     let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
            }
        }

    }
    
