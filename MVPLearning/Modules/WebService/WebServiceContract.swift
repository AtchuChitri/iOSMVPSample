//
//  WebServiceContract.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import Foundation

public typealias WebServiceCompletion = (Result<Data, Error>) -> Void


protocol WebServiceContract {
}

struct WebService: WebServiceContract {

    func processService(url:String, completion: @escaping WebServiceCompletion) {

    }
    
}
