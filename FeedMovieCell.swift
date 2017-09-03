//
//  FeedMovieCell.swift
//  NetFlix
//
//  Created by Diego Go on 8/30/17.
//  Copyright © 2017 Diego Go. All rights reserved.
// 

import UIKit

class FeedMovieCell: UITableViewCell {
    
    var movies: [Movie]? {
        didSet{
            colletionMovieView.movies = movies
        }
    }
    
    var type: Bool! {
        didSet{
            colletionMovieView.type = type
        }
    }
    
    let colletionMovieView: ColletionMovieView = {
       return ColletionMovieView()
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSObject){
        fatalError("init(code:) has be no implemeted")
    }
    
    private func setupViews(){
        addSubview(colletionMovieView.colletionView)
        cons(pattern: "H:|[v0]|", views: colletionMovieView.colletionView)
        cons(pattern: "V:[v0(170)]|", views: colletionMovieView.colletionView)
        
    }

}
