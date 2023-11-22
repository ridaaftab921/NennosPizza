//
//  DrinksViewModel.swift
//  NennosPizza
//
//  Created by Rida Aftab on 22/11/2023.
//

import Foundation

class DrinksViewModel {
    var drinks: [Drink] = []
    let dataStore: AppDataStore

    init(drinks: [Drink] = [], dataStore: AppDataStore) {
        self.drinks = drinks
        self.dataStore = dataStore
    }
    
    func fetchDrinks(completionHandler: @escaping ((Bool?) -> Void)) {
        dataStore.fetchDrinks { response in
            switch response {
            case .success(let drinks):
                self.drinks = drinks
                completionHandler(true)
            case .failure( _):
                break
            }
        }
    }
    
    func getDrinksCount() -> Int {
        return drinks.count
    }
    
    func getDrink(atIndex index: Int) -> Drink {
        return drinks[index]
    }
}
