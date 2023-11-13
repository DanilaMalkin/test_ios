//
//  BeerTableView.swift
//  ios_practical
//
//  Created by AlexGod on 30.10.2023.
//

import UIKit

protocol BeerTableViewDelegate {
    func didSelectRow(_ beerModel: BeerDTO)
        

}

final class BeerTableView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    private lazy var tableManager = BeerTableManager()
    var delegate: BeerTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemMint
        addSubviews()
        makeConstraints()
        spinnerView.startAnimating()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [BeerDTO]) {
        tableManager.tableData = viewModel
        spinnerView.stopAnimating()
        tableView.reloadData()
    }
    
}

//MARK: - BeerTableManagerDelegate

extension BeerTableView: BeerTableManagerDelegate {
    
    func didSelectRow(_ beerModel: BeerDTO) {
        delegate?.didSelectRow(beerModel)
    }
    
}

//MARK: - Private

private extension BeerTableView {
    
    func addSubviews() {
        [tableView, spinnerView].forEach {
            self.addSubview($0)
        }
    }
    
    func makeConstraints() {
        [tableView, spinnerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            spinnerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
    
}
