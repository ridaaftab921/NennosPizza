//
//  Pizza.swift
//  NennosPizza
//
//  Created by Rida Aftab on 18/11/2023.
//

import Foundation

struct Pizza: Decodable, Encodable {
    let name: String
    let ingredients: [Int]
    let imageUrl: String?
}

struct Ingredient: Decodable {
    let id: Int
    let name: String
    let price: Double
}

struct Pizzas: Decodable {
    let pizzas: [Pizza]
    let basePrice: Double
}

class PizzaViewModel {
    private let price: Double
    private let ingredients: [String]
    private let pizza: Pizza
    
    init(price: Double, ingredients: [String], pizza: Pizza) {
        self.price = price
        self.ingredients = ingredients
        self.pizza = pizza
    }
    
    func getIngredientsString() -> String {
        return ingredients.joined(separator: ", ")
    }
    
    func getName() -> String {
        return pizza.name
    }
    
    func getPizza() -> Pizza {
        return pizza
    }
    
    func getPrice() -> String {
        return String(format: "$%0.0f", price)
    }
    
    func getImageUrl() -> String {
        return pizza.imageUrl ?? ""
    }
    
    func containsIngredient(id: Int) -> Bool {
        return self.pizza.ingredients.contains(id)
    }
}
