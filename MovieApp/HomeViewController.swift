//
//  HomeViewController.swift
//  MovieApp
//
//  Created by saif adel on 1/3/21.
//

import UIKit
import TinyConstraints

class HomeViewController: UIViewController {
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "search"
        view.target(forAction: #selector(inputSearchView), withSender: .none)
        return view
    }()
    lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(seatchButtonOnTap))
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie App"
        view.backgroundColor = .systemBackground
        navigationItem.setRightBarButton(searchButton, animated: true)
        setupSubView()
    }
     
    fileprivate func setupSubView(){
        
        BottomView.setupSubView(view, navigationController!)
        setSearchBar()     //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    fileprivate func setSearchBar(){
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func seatchButtonOnTap(){
        
    }
   
    @objc func inputSearchView(){
        print("check")
    }

}

