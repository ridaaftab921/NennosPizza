//
//  ViewModel.swift
//  NennosPizza
//
//  Created by Rida Aftab on 18/11/2023.
//

import Foundation

class HomeViewModel {
    
    let dataStore: AppDataStore
    private var pizzas: Pizzas?
    private var ingredients: [Ingredient] = []
    private var pizzasViewModel: [PizzaViewModel] = []

    init(dataStore: AppDataStore) {
        self.dataStore = dataStore
    }
    
    func fetchPizzas(completionHandler: @escaping ((Bool?) -> Void)) {
        dataStore.fetchPizzas { response in
            switch response {
            case .success(let pizzas):
                self.pizzas = pizzas
                self.getIngredients(completionHandler: completionHandler)
            case .failure( _):
                completionHandler(false)
            }
        }
    }
    
    func getIngredients(completionHandler: @escaping ((Bool?) -> Void)) {
        dataStore.fetchIngredients { response in
            switch response {
            case .success(let ingredients):
                self.ingredients = ingredients
                self.createPizzaViewModel()
                completionHandler(true)
            case .failure( _):
                completionHandler(false)
            }
        }
    }
    
    func createPizzaViewModel() {
        if let pizzas = pizzas?.pizzas, let basePrice = self.pizzas?.basePrice {
        
            for pizza in pizzas {
                var pizzaPrice = basePrice
                var ingredientsNames: [String] = []
                for id in pizza.ingredients {
                    ingredientsNames.append(self.ingredients[id-1].name)
                    pizzaPrice += self.ingredients[id-1].price
                }
                pizzasViewModel.append(PizzaViewModel(price: pizzaPrice, ingredients: ingredientsNames, pizza: pizza))
            }
        }
    }
    func getPizzasCount() -> Int {
        pizzasViewModel.count
    }
    
    func getPizzaModel(atIndex index: Int) -> PizzaViewModel {
        return pizzasViewModel[index]
    }
    
    func getAllingredients() -> [Ingredient] {
        self.ingredients
    }
}
