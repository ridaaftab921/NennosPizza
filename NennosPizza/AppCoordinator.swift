//
//  AppCoordinator.swift
//  NennosPizza
//
//  Created by Rida Aftab on 21/11/2023.
//

import UIKit
import SwiftMessages

class AppCoordinator {
    
    private let navigationController: UINavigationController
    private weak var window: UIWindow?
    private let cartModel = Cart()
    private var appDataStore: AppDataStore
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
        appDataStore = DataStoreFactory.appDataStore()
        self.setNavigationBarAppearance()
    }
    
    func setNavigationBarAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.font: UIFont.heavy(size: 17) ?? UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.customThemeRed]
            
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
            
        } else {
            // Fallback for earlier versions
            let navigationBar = navigationController.navigationBar
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.customThemeRed, .font: UIFont.bold(size: 17) ?? UIFont.systemFont(ofSize: 17)]

        }
        self.navigationController.navigationBar.tintColor = .customThemeRed
        self.navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func start() {
        let viewModel = HomeViewModel(dataStore: self.appDataStore)
        let vc = HomeViewController(viewModel: viewModel, delegate: self)
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AppCoordinator: HomeViewControllerDelegate {
    
    func showPizzaDetail(pizza: PizzaViewModel, ingrediants: [Ingredient]) {
        let viewModel = PizzaDetailViewModel(pizzaModel: pizza, ingredients: ingrediants)
        let pizzaDetailViewController = PizzaDetailViewController(viewModel: viewModel, delegate: self)
        self.navigationController.pushViewController(pizzaDetailViewController, animated: true)
    }
    func showCartScreen() {
        let viewModel = CartViewModel(cart: self.cartModel, dataStore: self.appDataStore)
        let cartVC = CartViewController(viewModel: viewModel)
        cartVC.delegate = self
        self.navigationController.pushViewController(cartVC, animated: true)
    }
//
//    func fetchDrinks() {
//        self.appDataStore.fetchPizzas { response in
//            switch response {
//            case .success(let pizzas):
//                break
//            case .failure( _):
//                break
//            }
//        }
//    }
}

extension AppCoordinator: AddToCartDelegate {
    func addDrinkToCart(drink: Drink) {
        cartModel.add(drink: drink)
        showAddedToCardBanner()
    }
    
    
    func addPizzaToCart(pizza: PizzaViewModel) {
        cartModel.add(pizza: pizza)
        showAddedToCardBanner()
    }
    
    func showAddedToCardBanner() {
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = UIColor.customThemeRed
        status.bodyLabel?.textColor = UIColor.white
        status.configureContent(body: "ADDED TO CART")
        var statusConfig = SwiftMessages.defaultConfig
//        statusConfig.duration = .seconds(seconds: 3.0)
        statusConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: statusConfig, view: status)
    }
}

extension AppCoordinator: CartViewControllerDelegate {
    func showDrinksScreen() {
        let viewModel = DrinksViewModel(dataStore: self.appDataStore)
        let drinksVC = DrinksViewController(viewModel: viewModel, delegate: self)
        self.navigationController.pushViewController(drinksVC, animated: true)
    }
    
    func showThankYouScreen() {
        let thankyouVC = ThankYouViewController()
        self.navigationController.pushViewController(thankyouVC, animated: true)
    }
}
