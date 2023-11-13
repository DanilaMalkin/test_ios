//
//  BeerTableViewControllerFactory.swift
//  test_ios
//
//  Created by Danila on 13.11.2023.
//

final class BeerTableViewControllerFactory {
    func build() -> BeerTableViewController {
        let service = BeerService()
        let viewController = BeerTableViewController(service: service)
        return viewController
    }
}
