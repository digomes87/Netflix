//
//  MovieContinueCell.swift
//  NetFlix
//
//  Created by Diego Go on 8/30/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

class MovieContinueCell: UICollectionViewCell {
    
    
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
        setViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has be not implemeted")
    }
    
    private func setViews(){
        addSubview(titleLabel)
        cons(pattern: "H:|[v0]|", views: titleLabel)
        cons(pattern: "V:[v0(40)]|", views: titleLabel)
        
    }
}
