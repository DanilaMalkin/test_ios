//
//  BeerTableView.swift
//  test_ios
//
//  Created by Danila on 10.11.2023.
//

import UIKit

final class BeeerTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        //tableView.dataSource = self
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubview()
        makeConstrains()
        spinnerView.startAnimating()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




    

// MARK: Private
private extension BeeerTableView{
    func addSubview(){
        [tableView, spinnerView].forEach{
            self.addSubview($0)
        }
    }
    func makeConstrains(){
        [tableView, spinnerView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
            //tableView.translatesAutoresizingMaskIntoConstraints = false
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
    
