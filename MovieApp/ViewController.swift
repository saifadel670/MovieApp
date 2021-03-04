//
//  TopRattedViewController.swift
//  MovieApp
//
//  Created by saif adel on 1/3/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = App.Color.bottomBackGround
        return view
    }()

    lazy var nowPlayingButton: UIButton = getBottomButton(title: "Now Playing", method: #selector(nowPlayingButtonOnTap))
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
    
    lazy var collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var view  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    lazy var searchBarView: UISearchController = {
       let view = UISearchController(searchResultsController: nil)
        return view
    }()
    
    var movies: [Result] = [Result]()
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = App.Color.backGround
        title = "Movie App"
        navigationController?.navigationBar.barTintColor = .orange
        navigationItem.searchController = searchBarView
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.id)
        setSubView()
        nowPlayingButtonOnTap()
    }
    
    fileprivate func setSubView()
    {
        setupCollectionView()
        setupBottomSubView()
    }
    fileprivate func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .bottom)
        collectionView.height(to: view, multiplier: 0.92 )
    }
    
    private func getData(_ method: String){
        
        Network.shared.get(for: movie, method: "\(method)") { (movies, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let tmp_movies = movies else { return }
            self.movies = tmp_movies!.results
            self.collectionView.reloadData()
        }
        
    }
    
    fileprivate func setupBottomSubView(){
    
        setBottomView(view)
        setNowPlayingButton()
        setTopRattedButton()
        setPopularButton()
        setUpComingButton()
    }
    
    fileprivate func setBottomView(_ view: UIView){
        view.addSubview(bottomView)
        bottomView.edgesToSuperview(excluding:.top)
        bottomView.height(to: view, multiplier: 0.08)
    }
    
    fileprivate func setNowPlayingButton(){
        bottomView.addSubview(nowPlayingButton)
        nowPlayingButton.edges(to: bottomView, excluding: .trailing)
        nowPlayingButton.width(to: bottomView, multiplier: 0.25)
    }
    
    fileprivate func setButtonPosition(view:UIView, prevButton:UIButton, button:UIButton){
        view.addSubview(button)
        button.leftToRight(of: prevButton)
        button.height(to: view)
        button.width(to: view, multiplier: 0.25)
    }
    
    fileprivate func setTopRattedButton(){
        setButtonPosition(view:bottomView, prevButton:nowPlayingButton, button:topRattedButton)
    }
    
    fileprivate func setPopularButton(){
        setButtonPosition(view:bottomView,prevButton:topRattedButton, button:popularButton)
    }
    
    fileprivate func setUpComingButton(){
        setButtonPosition(view:bottomView,prevButton:popularButton, button:upComingButton)
    }
    

    
    @objc fileprivate func upComingButtonOnTap(){
        getData(Api.endpoint.upcoming.rawValue)
    }
    @objc fileprivate func nowPlayingButtonOnTap(){
        getData(Api.endpoint.now_playing.rawValue)
    }
    @objc fileprivate func popularButtonOnTap(){
        getData(Api.endpoint.popular.rawValue)
    }
    
    @objc fileprivate func topRattedButtonOnTap(){
        getData(Api.endpoint.top_rated.rawValue)
    }
    
    
    


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: MovieCollectionViewCell.id, for: indexPath) as? MovieCollectionViewCell else {
            fatalError("error to load movie")
        }
        let movieItem = movies[indexPath.item]
        cell.setupCellInfoForMovie(posterURL: movieItem.posterPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = width
        return .init(width: width  , height: height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 10, left: 16, bottom: 0, right: 16)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        
        let destination =  SingleMovieViewController()
        destination.titleName = movie.title
        destination.setData(title: movie.originalTitle, overview: movie.overview, language: movie.originalLanguage, relaeseDate: movie.releaseDate, posterURL: movie.posterPath)
        present(destination, animated: true, completion: nil)
 
    }

    
}
