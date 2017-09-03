//
//  ColletionMovieView.swift
//  NetFlix
//
//  Created by Diego Go on 8/30/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

class ColletionMovieView: NSObject, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let colletionId = "colletionId"
    let colletionMovieId = "colletionMovieId"
    
    var movies:[Movie]?
    var type:Bool = false
    
    lazy var colletionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cl = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cl.backgroundColor = UIColor.fromHex(value: 0x313131)
        cl.delegate = self
        cl.dataSource = self
        
        return cl
    }()
    
    override init(){
        super.init()
        colletionView.register(MovieContinueCell.self, forCellWithReuseIdentifier: colletionId)
        colletionView.register(MovieCell.self, forCellWithReuseIdentifier: colletionMovieId)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type{
            
            let  cell  = collectionView.dequeueReusableCell(withReuseIdentifier: colletionId, for: indexPath) as! MovieContinueCell
            cell.backgroundColor = .yellow
            cell.movie = movies?[indexPath.row]
            return cell
            
        }else{
            
            let  cell  = collectionView.dequeueReusableCell(withReuseIdentifier: colletionMovieId, for: indexPath) as! MovieCell
            cell.backgroundColor = .brown
            cell.movie = movies?[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if type{
            
            let width: CGFloat = collectionView.frame.width * 0.6
            return CGSize(width: width, height: width * (3 / 4))
        }else{
            let width: CGFloat = collectionView.frame.width * 0.29
            return CGSize(width: width, height: width * (16 / 9))
        }
    }
}
