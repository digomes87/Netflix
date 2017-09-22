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
            if let Url = movie?.imgUrl {
                img.image = UIImage(named: Url)
            }
        }
    }
    
    
    let img: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
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
        addSubview(img)
        cons(pattern: "H:|[v0]|", views: img)
        cons(pattern: "V:|[v0]|", views: img)
        
    }
}
