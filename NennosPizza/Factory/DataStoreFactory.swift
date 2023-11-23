//
//  DataStoreFactory.swift
//  NennosPizza
//
//  Created by Rida Aftab on 23/11/2023.
//

import Foundation
class DataStoreFactory {
    
    static func appDataStore() -> AppDataStoreImpl {
        let homeDataStore = AppDataStoreImpl(AlamofireNetworkManager.sharedInstance)
        return homeDataStore
    }
}
