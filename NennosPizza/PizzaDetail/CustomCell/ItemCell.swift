//
//  ItemCell.swift
//  NennosPizza
//
//  Created by Rida Aftab on 21/11/2023.
//

import Foundation

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var removeItemAction: (() -> Void)?

    
    @IBAction func actionButtonTapped(_ sender: Any) {
        if let action = removeItemAction {
            action()
        }
    }
    func configureForIngredient(ingredient: Ingredient, showTick: Bool) {
        nameLabel.text = ingredient.name
        priceLabel.text = String(format: "$%0.0f", ingredient.price)
        actionButton.isHidden = !(showTick)
        actionButton.setImage(UIImage(named: "tickIcon")?.withTintColor(.customThemeRed), for: .normal)
    }
    
    func configureCartItem(withPizza pizza: PizzaViewModel) {
        nameLabel.text = pizza.getName()
        priceLabel.text = pizza.getPrice()
        actionButton.setImage(UIImage(named: "crossIcon")?.withTintColor(.customThemeRed), for: .normal)
    }
    
    func configureCartItem(withDrink drink: Drink) {
        nameLabel.text = drink.name
        priceLabel.text = String(format: "$%0.0f", drink.price)
        actionButton.setImage(UIImage(named: "crossIcon")?.withTintColor(.customThemeRed), for: .normal)
    }
    
    func configureForDrink(drink: Drink) {
        nameLabel.text = drink.name
        priceLabel.text = String(format: "$%0.0f", drink.price)
        actionButton.setImage(UIImage(systemName: "plus")?.withTintColor(.customThemeRed), for: .normal)
    }
}
