//
//  DrinksViewController.swift
//  NennosPizza
//
//  Created by Rida Aftab on 21/11/2023.
//

import UIKit

class DrinksViewController: UIViewController {
    
    var viewModel: DrinksViewModel
    weak var delegate: AddToCartDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    init(viewModel: DrinksViewModel, delegate: AddToCartDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DRINKS"
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        fetchData()
    }

    func fetchData() {
        self.showActivityIndicatorView()
        viewModel.fetchDrinks { [weak self] success in
            self?.hideActivityIndicatorView()
            guard success ?? false else {
                self?.showError(buttonHandler: {
                    self?.fetchData()
                })
                return
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDrinksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell
        cell?.configureForDrink(drink: viewModel.getDrink(atIndex: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.addDrinkToCart(drink: viewModel.getDrink(atIndex: indexPath.row))
    }
}
