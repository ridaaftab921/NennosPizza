//
//  CartViewController.swift
//  NennosPizza
//
//  Created by Rida Aftab on 21/11/2023.
//

import UIKit
import SDWebImage


protocol CartViewControllerDelegate: AnyObject {
    func showDrinksScreen()
    func showThankYouScreen()
}
class CartViewController: UIViewController {
    var viewModel: CartViewModel
    weak var delegate: CartViewControllerDelegate?
    
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var emptyCartLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CART"
        setNavigationBar()
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emptyCartLabel.isHidden = !(viewModel.isCartEmpty())
        checkoutButton.isHidden = viewModel.isCartEmpty()
        tableView.reloadData()
    }
    
    func setNavigationBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        let button1 = UIBarButtonItem(image: UIImage(named: "ic_drinks"), style: .plain, target: self, action: #selector(onDrinksTapped))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    @IBAction func onCheckoutTapped(_ sender: Any) {
        self.createOrder()
    }
    func createOrder() {
        self.showActivityIndicatorView()
        viewModel.createOrder() { [weak self] success in
            self?.hideActivityIndicatorView()
            guard success ?? false else {
                self?.showError(buttonHandler: {
                    self?.createOrder()
                })
                return
            }
            self?.delegate?.showThankYouScreen()
        }
    }
    @objc func onDrinksTapped(){
        delegate?.showDrinksScreen()
    }
    
}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.getPizzasCount()
        case 1:
            return viewModel.getDrinksCount()
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell

        switch indexPath.section {
        case 0:
            cell?.configureCartItem(withPizza: self.viewModel.getPizza(atIndex: indexPath.row))
        case 1:
            cell?.configureCartItem(withDrink: self.viewModel.getDrink(atIndex: indexPath.row))
        default:
            break
        }
        return cell ?? UITableViewCell()
    }
}

