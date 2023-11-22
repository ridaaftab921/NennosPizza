//
//  PizzaDetailViewModel.swift
//  NennosPizza
//
//  Created by Rida Aftab on 20/11/2023.
//

import Foundation

class PizzaDetailViewModel {
    var pizzaModel: PizzaViewModel
    var ingredients: [Ingredient]
    
    init(pizzaModel: PizzaViewModel, ingredients: [Ingredient]) {
        self.pizzaModel = pizzaModel
        self.ingredients = ingredients
    }
    
    func getIngredientsCount() -> Int {
        return self.ingredients.count
    }
    
    func getIngredientPrice(atIndex index: Int) -> Double {
        return self.ingredients[0].price
    }
    
    func isIngredientIncluded(index: Int) -> Bool {
        return self.pizzaModel.containsIngredient(id: ingredients[index].id)
    }
}
