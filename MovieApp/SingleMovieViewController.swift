//
//  SingleMovieViewController.swift
//  MovieApp
//
//  Created by saif adel on 3/3/21.
//

import UIKit
import TinyConstraints
import SDWebImage
class SingleMovieViewController: UIViewController {
    
    
    var titleName: String?
    
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
        label.textColor = .label
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    lazy var overViewTextView: UILabel = {
        let text = UILabel()
        text.clipsToBounds = true
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .label
        text.numberOfLines = 0
        text.textAlignment = NSTextAlignment.justified
        return text
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleName
        view.backgroundColor = .systemBackground
        view.accessibilityScroll(.left)
        setupSubView()

        // Do any additional setup after loading the view.
    }
    fileprivate func setupSubView(){
        setimageView()
        setTitleLabel()
        setlanguageLabel()
        setOverViewTextView()
        setReleaseDateLabel()
    }

    fileprivate func setimageView(){
        view.addSubview(imageView)
        imageView.edgesToSuperview(excluding: .top)
        imageView.topToSuperview(usingSafeArea: true)
        imageView.heightToWidth(of: view)
    }
    fileprivate func setTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.topToBottom(of: imageView, offset: 6)
        //titleLabel.leadingToTrailing(of: view)
    }
    
    fileprivate func setlanguageLabel(){
        view.addSubview(languageLabel)
        languageLabel.topToBottom(of: titleLabel, offset: 6)
    }
    
    fileprivate func setOverViewTextView(){
        view.addSubview(overViewTextView)
        overViewTextView.topToBottom(of: languageLabel, offset: 6)
        overViewTextView.leading(to: view, offset:6)
        overViewTextView.trailing(to: view, offset:-6)
    }
    
    fileprivate func setReleaseDateLabel(){
        view.addSubview(releaseDateLabel)
        releaseDateLabel.topToBottom(of: overViewTextView, offset: 6)
        //releaseDateLabel.bottom(to: view, offset: 2)
    }
    
    public func setData(title: String, overview: String, language: String, relaeseDate: String, posterURL: String){
        guard let url = URL(string: "http://image.tmdb.org/t/p/original\(posterURL)") else { return }
        imageView.sd_setImage(with: url)
        titleLabel.text = title
        releaseDateLabel.text = " Realease Date: \(relaeseDate)"
        languageLabel.text = "Language: \(language)"
        overViewTextView.text = "Overview: \r\n\(overview)"
        
        
    }

}
