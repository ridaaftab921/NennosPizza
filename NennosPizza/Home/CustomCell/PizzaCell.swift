//
//  PizzaCell.swift
//  NennosPizza
//
//  Created by Rida Aftab on 18/11/2023.
//

import UIKit

protocol PizzaCellDelegate: AnyObject {
    func onCartTapped(pizza: PizzaViewModel)
}

class PizzaCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    weak var delegate: PizzaCellDelegate?
    
    var viewModel: PizzaViewModel?
//    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var pizzaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundView = UIImageView(image: UIImage(named: "bg_wood"))
    }
    func configureWithPizza(pizza: PizzaViewModel) {
        self.viewModel = pizza
        nameLabel.text = pizza.getName()
        ingredientsLabel.text = pizza.getIngredientsString()
        cartButton.setTitle(pizza.getPrice(), for: .normal)
        cartButton.setImage(UIImage(named: "ic_cart_button")?.withTintColor(.white), for: .normal)
        cartButton.layer.cornerRadius = 8.0
        if let url = URL(string: pizza.getImageUrl()) {
            pizzaImageView.sd_setImage(with: url)
        }
    }
    
    @IBAction func onCartButtonTapped(_ sender: Any) {
        if let pizza = viewModel {
            delegate?.onCartTapped(pizza: pizza)
        }
    }
}
