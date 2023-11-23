//
//  MockNetworkingObject.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import Foundation
@testable import NennosPizza

class NetworkingMockObject: AlamofireNetworking {

    let success: Bool
    let response: Decodable?
    
    init(success: Bool, response: Decodable) {
        self.success = success
        self.response = response
    }

    func run<T>(_ request: NennosPizza.DataRequest, completionHandler: @escaping NennosPizza.DataResponseHandler<T>) where T : Decodable {
        if success {
            let value = DataResponseModel<T>(result: .success(response as! T))
            completionHandler(value)
        } else {
            let value = DataResponseModel<T>(result: .failure(NetworkError(statusCode: 100, errorMessage: "")))
            completionHandler(value)
        }
    }
}
