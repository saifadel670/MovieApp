//
//  HomeViewController.swift
//  MovieApp
//
//  Created by saif adel on 1/3/21.
//

import UIKit
import TinyConstraints

class HomeViewController: UIViewController {
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = App.Color.bottomBackGround
        return view
    }()

    lazy var latestButton: UIButton = getBottomButton(title: "Latest", method: upComingButtonOnTap())
    lazy var popularButton: UIButton = getBottomButton(title: "Popular",method: upComingButtonOnTap())
    lazy var topRattedButton: UIButton = getBottomButton(title: "Top Ratted",method: upComingButtonOnTap())
    lazy var upComingButton: UIButton = getBottomButton(title: "Up Coming",method: upComingButtonOnTap())
    
    fileprivate func getBottomButton(title: String, method:())-> UIButton{
        
        let button  = UIButton(type: .system)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(App.Color.buttonText, for: .normal)
        button.backgroundColor = App.Color.buttonBackGround
        button.addTarget(self, action: #selector(topRattedButtonOnTap), for: .touchUpInside)
//        button.addTarget(self, action: #selector(method), for: .touchUpInside)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie App"
        view.backgroundColor = .systemBackground
        setupSubView()
       
    }
    
    fileprivate func setupSubView(){
        //setbottomView()
        setBottomView()
        setLatestButton()
        setTopRattedButton()
        setPopularButton()
        setUpComingButton()
    }
    
    fileprivate func setBottomView(){
        view.addSubview(bottomView)
        bottomView.edgesToSuperview(excluding:.top)
        bottomView.height(to: view, multiplier: 0.08)
    }
    
    fileprivate func setLatestButton(){
        bottomView.addSubview(latestButton)
        latestButton.edges(to: bottomView, excluding: .trailing)
        latestButton.width(to: bottomView, multiplier: 0.25)
    }
    
    fileprivate func setButtonPosition(view:UIView, prevButton:UIButton, button:UIButton){
        view.addSubview(button)
        button.leftToRight(of: prevButton)
        button.height(to: view)
        button.width(to: view, multiplier: 0.25)
    }
    
    fileprivate func setTopRattedButton(){
        setButtonPosition(view:bottomView, prevButton:latestButton, button:topRattedButton)
    }
    
    fileprivate func setPopularButton(){
        setButtonPosition(view:bottomView,prevButton:topRattedButton, button:popularButton)
    }
    
    fileprivate func setUpComingButton(){
        setButtonPosition(view:bottomView,prevButton:popularButton, button:upComingButton)
    }
    
    
    
    
    
    @objc fileprivate func upComingButtonOnTap(){
        
    }
    @objc fileprivate func latestButtonOnTap(){
        
    }
    @objc fileprivate func popularButtonOnTap(){
        
    }
    
    @objc fileprivate func topRattedButtonOnTap(){
        navigationController?.pushViewController(TopRattedViewController(), animated: true)
    }


}

