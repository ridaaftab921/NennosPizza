//
//  Cart.swift
//  NennosPizza
//
//  Created by Rida Aftab on 21/11/2023.
//

import Foundation

class Cart {
    
    private var pizzas: [PizzaViewModel] = []
    private var drinks: [Drink] = []
 
    init() {
//        retrieveItems()
    }
    
    func getPizzasCount() -> Int {
        return pizzas.count
    }
    
    func getDrinksCount() -> Int {
        return drinks.count
    }
    
    func getPizza(atIndex index: Int) -> PizzaViewModel {
        return pizzas[index]
    }
    
    func getDrink(atIndex index: Int) -> Drink {
        return drinks[index]
    }
    
    func getPizzas() -> [Pizza] {
        return pizzas.map { $0.getPizza() }
    }
    
    func getDrinkIds() -> [Int] {
        return drinks.map { $0.id }
    }
    
    func removePizza(atIndex index: Int) {
        pizzas.remove(at: index)
    }
    
    func removeDrink(atIndex index: Int)  {
        drinks.remove(at: index)
    }
    
//    private func persistItems() {
//        removePersistedItems()
//        UserDefaults.standard[.cartItems] = items
//    }
//
//    private func retrieveItems() {
//        items = UserDefaults.standard[.cartItems] ?? []
//    }
//
//    private func removePersistedItems() {
//        UserDefaults.standard[.cartItems]?.removeAll()
//    }
}
extension Cart {
    func add(pizza: PizzaViewModel) {
        pizzas.append(pizza)
    }
    
    func add(drink: Drink) {
        drinks.append(drink)
    }
}
