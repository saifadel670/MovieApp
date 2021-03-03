//
//  Search.swift
//  MovieApp
//
//  Created by saif adel on 3/3/21.
//

import UIKit
import TinyConstraints
class SearchController: UIViewController{
    
    lazy var searchInputView: UIInputView = {
       let view = UIInputView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.target(forAction: #selector(inputSearchView), withSender: .none)
        return view
    }()
    
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "search"
        view.target(forAction: #selector(inputSearchView), withSender: .none)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchBar.edgesToSuperview()
    }
    
    @objc func inputSearchView(){
        print("check")
    }
}
