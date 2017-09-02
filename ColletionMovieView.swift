//
//  ColletionMovieView.swift
//  NetFlix
//
//  Created by Diego Go on 8/30/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

class ColletionMovieView: NSObject, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let colletionId = "colletion_id"
    var movies:[Movie]?
    
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
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell  = collectionView.dequeueReusableCell(withReuseIdentifier: colletionId, for: indexPath) as! MovieContinueCell
        cell.backgroundColor = .orange
        cell.movie = movies?[indexPath.section]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width * 0.6
        return CGSize(width: width, height: width * (3 / 4))
    }
}
