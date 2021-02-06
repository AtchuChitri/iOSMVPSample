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
        
}

struct WebService: WebServiceContract {

    func processService(urI:String, completion: @escaping WebServiceCompletion) {
    
        AF.request(Constant.baseUrl + urI).response { response in
            debugPrint(response)
        }

    }
    
}
