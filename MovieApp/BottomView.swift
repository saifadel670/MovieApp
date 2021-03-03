//
//  BottomView.swift
//  MovieApp
//
//  Created by saif adel on 3/3/21.
//

import UIKit

class BottomView: UIView{
    
    var navigationCntrl: UINavigationController?
    lazy var bottomView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = App.Color.bottomBackGround
        return view
    }()

    lazy var latestButton: UIButton = getBottomButton(title: "Latest", method: #selector(latestButtonOnTap))
    lazy var popularButton: UIButton = getBottomButton(title: "Popular",method: #selector(popularButtonOnTap))
    lazy var topRattedButton: UIButton = getBottomButton(title: "Top Ratted",method: #selector(topRattedButtonOnTap))
    lazy var upComingButton: UIButton = getBottomButton(title: "Up Coming",method: #selector(upComingButtonOnTap))
    
    fileprivate func getBottomButton(title: String, method: Selector)-> UIButton{
        
        let button  = UIButton(type: .system)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(App.Color.buttonText, for: .normal)
        button.backgroundColor = App.Color.buttonBackGround
        button.addTarget(self, action: method, for: .touchUpInside)
        return button
    }
    
    static func setupSubView(_ view:UIView, _ navigationController: UINavigationController){
        //setbottomView()
        let bottomView = BottomView()
        bottomView.navigationCntrl = navigationController
        bottomView.setBottomView(view)
        bottomView.setLatestButton()
        bottomView.setTopRattedButton()
        bottomView.setPopularButton()
        bottomView.setUpComingButton()
    }
    
    fileprivate func setBottomView(_ view: UIView){
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
        print("upComingButtonOnTap")
    }
    @objc fileprivate func latestButtonOnTap(){
        print("latest")
    }
    @objc fileprivate func popularButtonOnTap(){
        print("popular")
    }
    
    @objc fileprivate func topRattedButtonOnTap(){
     
       //let tmp = HomeViewController()
       // let tmp: UINavigationController = HomeViewController.getNavigationController()
        navigationCntrl?.pushViewController(TopRattedViewController(), animated: true)
    }
}
