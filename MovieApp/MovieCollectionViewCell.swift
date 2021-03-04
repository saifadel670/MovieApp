//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by saif adel on 1/3/21.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    static let id = "MovieCollectionViewCell"
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = App.Color.movieCellBackGround
        setupSubView()
    }
    
    fileprivate func setupSubView(){
        setimageView()
        
    }
    
    fileprivate func setimageView(){
        self.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .bottom)
        let width = self.frame.width
        imageView.height(width)
        imageView.width(width)
    }
   
    
    public func setupCellInfoForMovie(posterURL: String){
        
        guard let url = URL(string: "http://image.tmdb.org/t/p/original\(posterURL)") else {  return  }
        imageView.sd_setImage(with: url)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) movie cell has not been implemented")
    }
}
