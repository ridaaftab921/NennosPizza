//
//  ViewController.swift
//  NennosPizza
//
//  Created by Rida Aftab on 18/11/2023.
//

import UIKit
import SDWebImage

protocol HomeViewControllerDelegate: AnyObject {
    func showPizzaDetail(pizza: PizzaViewModel, ingrediants: [Ingredient])
    func showCartScreen() 
}

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    weak var delegate: HomeViewControllerDelegate?

    @IBOutlet weak var pizzasTableView: UITableView!

    init(viewModel: HomeViewModel, delegate: HomeViewControllerDelegate? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        setNavigationBar()
        pizzasTableView.register(UINib(nibName: "PizzaCell", bundle: nil), forCellReuseIdentifier: "PizzaCell")
    }
    
    func setNavigationBar() {
        self.title = "NENNO'S PIZZA"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        let button1 = UIBarButtonItem(image: UIImage(named: "ic_cart_navbar"), style: .plain, target: self, action: #selector(onCartButtonTapped))
        self.navigationItem.leftBarButtonItem  = button1
    }
    
    func fetchData() {
        self.showActivityIndicatorView()
        viewModel.fetchPizzas { [weak self] success in
            self?.hideActivityIndicatorView()
            guard success ?? false else {
                self?.showError(buttonHandler: {
                    self?.fetchData()
                })
                return
            }
            DispatchQueue.main.async {
                self?.pizzasTableView.reloadData()
            }
        }
    }
    
    @objc func onCartButtonTapped(){
        delegate?.showCartScreen()
    }
    
    @objc func onAddTapped(){
         print("clicked")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getPizzasCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath) as? PizzaCell
        
        let vm = viewModel.getPizzaModel(atIndex: indexPath.row)
        cell?.configureWithPizza(pizza: vm)
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
}

extension HomeViewController: PizzaCellDelegate {
    func onCartTapped(pizza: PizzaViewModel) {
        self.delegate?.showPizzaDetail(pizza: pizza, ingrediants: viewModel.getAllingredients())
    }
}
