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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = App.Color.movieCellTitle
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = App.Color.movieCellReleaseDate
        return label
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = App.Color.movieCellInfo
        return label
    }()
    
    lazy var overViewTextView: UITextView = {
        let text = UITextView()
        text.clipsToBounds = true
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.textColor = App.Color.movieCellOverView
        return text
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = App.Color.movieCellBackGround
        setupSubView()
    }
    
    fileprivate func setupSubView(){
        setimageView()
        setTitleLabel()
        setlanguageLabel()
        setOverViewTextView()
        setReleaseDateLabel()
    }
    
    fileprivate func setimageView(){
        self.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .bottom)
        imageView.heightToWidth(of: self)
    }
    fileprivate func setTitleLabel(){
        self.addSubview(titleLabel)
        titleLabel.topToBottom(of: imageView, offset: 2)
    }
    
    fileprivate func setlanguageLabel(){
        self.addSubview(languageLabel)
        languageLabel.topToBottom(of: titleLabel,offset: 1.5)
    }
    
    fileprivate func setOverViewTextView(){
        self.addSubview(overViewTextView)
        overViewTextView.topToBottom(of: languageLabel, offset: 2)
    }
    
    fileprivate func setReleaseDateLabel(){
        self.addSubview(releaseDateLabel)
        releaseDateLabel.topToBottom(of: overViewTextView, offset: 4)
        releaseDateLabel.bottom(to: self, offset: 2)
    }
    
    fileprivate func setupCellInfoForUpcammingMovie(posterURL: String, title: String, language: String, overView: String, releaseDate: String){
        
        titleLabel.text = title
        languageLabel.text = language
        overViewTextView.text = overView
        releaseDateLabel.text = releaseDate
        guard let url = URL(string: posterURL) else {  return  }
        imageView.sd_setImage(with: url)
        
    }
    
    public func setupCellInfoForUpcammingMovie(posterURL: String, title: String, language: String, overView: String){
        
        titleLabel.text = title
        languageLabel.text = language
        overViewTextView.text = overView
        guard let url = URL(string: posterURL) else {  return  }
        imageView.sd_setImage(with: url)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) movie cell has not been implemented")
    }
}
