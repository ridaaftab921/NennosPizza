//
//  PizzasStub.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import Foundation
@testable import NennosPizza

let pizzasStub = "{\"basePrice\":4,\"pizzas\":[{\"ingredients\":[1,2],\"name\":\"Margherita\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44095.png\"},{\"ingredients\":[1,5],\"name\":\"Ricci\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44092.png\"},{\"ingredients\":[1,2,3,4],\"name\":\"Boscaiola\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44090.png\"},{\"ingredients\":[1,5,6],\"name\":\"Primavera\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44077.png\"},{\"ingredients\":[1,2,7,8],\"name\":\"Hawaii\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44073.png\"},{\"ingredients\":[1,9,10],\"name\":\"MareBianco\"},{\"ingredients\":[1,2,4,8,9,10],\"name\":\"Mariemonti\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44075.png\"},{\"ingredients\":[1,9],\"name\":\"Bottarga\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44071.png\"},{\"ingredients\":[1,2,9,6],\"name\":\"BoottargaeAsparagi\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44068_error_on_purpose.png\"},{\"ingredients\":[1,5,6],\"name\":\"RiccieAsparagi\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44066.png\"}]}"

let ingredientsStub = "[{\"price\":1,\"name\":\"Mozzarella\",\"id\":1},{\"price\":0.5,\"name\":\"TomatoSauce\",\"id\":2},{\"price\":1.5,\"name\":\"Salami\",\"id\":3},{\"price\":2,\"name\":\"Mushrooms\",\"id\":4},{\"price\":4,\"name\":\"Ricci\",\"id\":5},{\"price\":2,\"name\":\"Asparagus\",\"id\":6},{\"price\":1,\"name\":\"Pineapple\",\"id\":7},{\"price\":3,\"name\":\"Speck\",\"id\":8},{\"price\":2.5,\"name\":\"Bottarga\",\"id\":9},{\"price\":2.2,\"name\":\"Tuna\",\"id\":10}]"

let drinksStub = "[{\"price\":1,\"name\":\"StillWater\",\"id\":1},{\"price\":1.5,\"name\":\"SparklingWater\",\"id\":2},{\"price\":2.5,\"name\":\"Coke\",\"id\":3},{\"price\":3,\"name\":\"Beer\",\"id\":4},{\"price\":4,\"name\":\"RedWine\",\"id\":5}]"

let margheritaPizzaStub = "{\"ingredients\":[1,2],\"name\":\"Margherita\",\"imageUrl\":\"https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44095.png\"}"
let ricciPizzaStub = "{\"ingredients\":[1,5],\"name\":\"Ricci\"}"

let stillWaterStub = "{\"price\":1,\"name\":\"StillWater\",\"id\":1}"

let emptyCart: Cart = {
    return Cart()
}()

let filledCart: Cart = {
    let margheritaPizza = (try? JSONDecoder().decode(Pizza.self, from: margheritaPizzaStub.data(using: .utf8)!))!
    let stillWater = (try? JSONDecoder().decode(Drink.self, from: stillWaterStub.data(using: .utf8)!))!
    let margheritaPizzaViewModel = PizzaViewModel(price: 6.0, ingredients: [""], pizza: margheritaPizza)
    let cart = Cart()
    
    cart.add(drink: stillWater)
    cart.add(pizza: margheritaPizzaViewModel)
    return cart
}()

let margheritaPizzaViewModel: PizzaViewModel = {
    let margheritaPizza = (try? JSONDecoder().decode(Pizza.self, from: margheritaPizzaStub.data(using: .utf8)!))!
    return PizzaViewModel(price: 6.0, ingredients: [""], pizza: margheritaPizza)
}()

let ricciPizzaViewModel: PizzaViewModel = {
    let ricciPizza = (try? JSONDecoder().decode(Pizza.self, from: ricciPizzaStub.data(using: .utf8)!))!
    return PizzaViewModel(price: 6.0, ingredients: [""], pizza: ricciPizza)
}()
let stillWaterDrink: Drink = {
    return (try? JSONDecoder().decode(Drink.self, from: stillWaterStub.data(using: .utf8)!))!
}()

let allIngredientsModel: [Ingredient] = {
    return (try? JSONDecoder().decode([Ingredient].self, from: ingredientsStub.data(using: .utf8)!)) ?? []
}()

let allDrinksModel: [Drink] = {
    return (try? JSONDecoder().decode([Drink].self, from: drinksStub.data(using: .utf8)!)) ?? []
}()
let pizzasModel: Pizzas = {
    return (try? JSONDecoder().decode(Pizzas.self, from: pizzasStub.data(using: .utf8)!))!
}()
