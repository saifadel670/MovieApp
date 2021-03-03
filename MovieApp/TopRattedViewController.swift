//
//  TopRattedViewController.swift
//  MovieApp
//
//  Created by saif adel on 1/3/21.
//

import UIKit
import Alamofire

class TopRattedViewController: UIViewController {
    
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
    
    var movies: [MovieData] = [MovieData]()
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top"
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.id)
        setSubView()
        print("done.......")
        getData()
    }
    
    fileprivate func setSubView()
    {
        setupCollectionView()
    }
    fileprivate func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .bottom)
        collectionView.height(to: view, multiplier: 0.92 )
    }
    
    private func getData(){
        
                AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=ad29645ae17eaf42e832f46c206d5296").responseJSON { (response) in
                    print(response)
                    guard let data = response.data else {return}
                    
                    do{
                        let data_tmp = try JSONDecoder().decode(Movie.self, from: data)
                        print(data_tmp)
                    }catch  let error {
                        print(error)
                    }
                }
        
        
        
//        Network.shared.get(for: movie, method: "\(Api.endpoint.top_rated)") { (movies, error) in
//            if error != nil {
//                print("!!!!!!!!!!")
//                return
//            }
//            print("huuuuuuu")
//            guard let tmp_movies = movies else { return }
//            self.movies = tmp_movies ?? Movie();
//            print(self.movies)
//            self.collectionView.reloadData()
//        }
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
extension TopRattedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 100
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: MovieCollectionViewCell.id, for: indexPath) as? MovieCollectionViewCell else {
            fatalError("error to load movie")
        }
        //cell.setupCellInfoForUpcammingMovie(posterURL: "fs", title: "", language: "", overView: " f")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height * 0.85
        return .init(width: width  , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
