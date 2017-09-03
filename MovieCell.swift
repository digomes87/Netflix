//
//  MovieCell.swift
//  NetFlix
//
//  Created by Diego Go on 9/2/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    
    var movie: Movie?{
        didSet{
            titleLabel.text = movie?.title
        }
    }
    
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Titulo do Filme Aqui"
        
        return lbl
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has be not implemeted")
    }
    
    private func setupViews(){
        addSubview(titleLabel)
        cons(pattern: "H:|[v0]|", views: titleLabel)
        cons(pattern: "V:[v0(40)]|", views: titleLabel)
        
    }
}
