//
//  Order.swift
//  NennosPizza
//
//  Created by Rida Aftab on 22/11/2023.
//

import Foundation

struct RequestModel: Encodable {
    let pizzas: [Pizza]
    let drinks: [Int]
}

struct EmptyResponseModel: Decodable {
    
}
