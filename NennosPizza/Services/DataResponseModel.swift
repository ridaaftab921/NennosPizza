//
//  DataResponseModel.swift
//  NennosPizza
//
//  Created by Rida Aftab on 23/11/2023.
//

import Foundation

enum ResultType<T> {
    case success(T)
    case failure(NetworkError)
}
struct DataResponseModel<T> {
    let result: ResultType<T>
}

public struct NetworkError: Error, CustomStringConvertible {
    
    let statusCode: Int
    public var description: String

    init(statusCode: Int, errorMessage: String) {
        self.statusCode = statusCode
        self.description = errorMessage
    }
}
