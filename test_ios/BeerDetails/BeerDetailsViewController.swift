//
//  BeerDetailsViewController.swift
//  test_ios
//
//  Created by Danila on 13.11.2023.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    var beerModel: BeerDTO?
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var subtitleView: UILabel = {
        let view = UILabel()
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        addSubviews()
        makeConstrains()
        configure()
        

        // Do any additional setup after loading the view.
    }
    
    func addSubviews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subtitleView)
        
    }
    
    func makeConstrains(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            
        ])
    }
    
    func configure() {
        titleView.text = beerModel?.name
        subtitleView.text = beerModel?.tagline
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
