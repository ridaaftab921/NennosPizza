//
//  PizzaDetailViewController.swift
//  NennosPizza
//
//  Created by Rida Aftab on 20/11/2023.
//

import UIKit
import SDWebImage

protocol AddToCartDelegate: AnyObject {
    func addPizzaToCart(pizza: PizzaViewModel)
    func addDrinkToCart(drink: Drink)
}
class PizzaDetailViewController: UIViewController {
    var viewModel: PizzaDetailViewModel
    weak var delegate: AddToCartDelegate?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    init(viewModel: PizzaDetailViewModel, delegate: AddToCartDelegate? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = viewModel.pizzaModel.getName().uppercased()
        addToCartBtn.setTitle(String(format: "ADD TO CART(%@)", viewModel.pizzaModel.getPrice()), for: .normal)
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        tableView.reloadData()
    }
    @IBAction func addToCart(_ sender: Any) {
        delegate?.addPizzaToCart(pizza: self.viewModel.pizzaModel)
    }
    
}

extension PizzaDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getIngredientsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell
        
        let ingredient = self.viewModel.ingredients[indexPath.row]
        let showTick = self.viewModel.isIngredientIncluded(index: indexPath.row)
        cell?.configureForIngredient(ingredient: ingredient, showTick: showTick)
        
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 354
    }
    
    func getHeaderView() -> UIView {
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 354))
        stackView.axis = .vertical
        stackView.spacing = 24.0
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        if let backgroundImage = UIImage(named: "bg_wood") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }

        if let url = URL(string: viewModel.pizzaModel.getImageUrl()) {
            var pizzaImageView : UIImageView!
        
            pizzaImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 270))
            pizzaImageView.contentMode =  .scaleAspectFit
            pizzaImageView.clipsToBounds = true
            pizzaImageView.sd_setImage(with: url)
            pizzaImageView.center = view.center
            view.addSubview(pizzaImageView)
        }
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.bold(size: 24.0)
        titleLabel.textColor = UIColor.customGray
        titleLabel.text = "   Ingredients"
        
        stackView.addArrangedSubview(view)
        stackView.addArrangedSubview(titleLabel)
        return stackView
    }
}
