//
//  CartViewModel.swift
//  NennosPizza
//
//  Created by Rida Aftab on 22/11/2023.
//

import Foundation

class CartViewModel {
    
    private var cart: Cart
    let dataStore: AppDataStore

    init(cart: Cart, dataStore: AppDataStore) {
        self.cart = cart
        self.dataStore = dataStore
    }
    
    func isCartEmpty() -> Bool {
        return getPizzasCount() == 0 && getDrinksCount() == 0
    }
    
    func getPizzasCount() -> Int {
        cart.getPizzasCount()
    }
    
    func getDrinksCount() -> Int {
        cart.getDrinksCount()
    }
    
    func getPizza(atIndex index: Int) -> PizzaViewModel {
        return cart.getPizza(atIndex: index)
    }

    func getDrink(atIndex index: Int) -> Drink {
        return cart.getDrink(atIndex: index)
    }
    
    func removerPizza(atIndex index: Int) {
        cart.removePizza(atIndex: index)
    }
    
    func removerDrink(atIndex index: Int) {
        cart.removeDrink(atIndex: index)
    }
    
    func createOrder(completionHandler: @escaping ((Bool?) -> Void)) {
        dataStore.createOrder(cart: cart){ response in
            switch response {
            case .success( _):
                completionHandler(true)
            case .failure( _):
                completionHandler(false)
            }
        }
    }
}
