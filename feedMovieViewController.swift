//
//  ViewController.swift
//  NetFlix
//
//  Created by Diego Go on 8/27/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

class feedMovieViewController: UITableViewController {
    
    let cellId = "CelAid"
    var feedMovie: FeedMovie?
    let progress: UIActivityIndicatorView = {
        let p = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        p.backgroundColor = .black
        p.translatesAutoresizingMaskIntoConstraints = false
        p.startAnimating()
        
        return p
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupIndicatorView()
        setupView()
        
        let api = NetFlixAPI.share
        api.delegate = self
        api.request()
    }
    
    private func setupView(){
        tableView.register(FeedMovieCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    
    
    private func setupIndicatorView(){
        //a magia do autolayout
        
        guard let window = UIApplication.shared.keyWindow else {return}
        
        window.addSubview(progress)
        window.bringSubview(toFront: progress)
        
        window.cons(pattern: "H:|[v0]|", views: progress)
        window.cons(pattern: "V:|[v0]|", views: progress)
    }
}

//Extension ajudam a organizar o codigo

extension feedMovieViewController: FeedMovieDelegate{
    //toda vez q se uma uma extension se deve implemtnar o metodo dela
    func response(status: Int, feed: FeedMovie) {
        progress.removeFromSuperview()
        
        if status == 200 {
            self.feedMovie = feed
            tableView?.reloadData()
        }
    }
}

extension feedMovieViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return feedMovie?.movie.keys.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let movie = feedMovie?.movie{
            return Array(movie.keys)[section]
            
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let width: CGFloat = tableView.frame.width * 0.6
            return  width * (3 / 4)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedMovieCell
        
        
        if let m = feedMovie?.movie{
            let key = Array(m.keys)[indexPath.section]
            let movie = m[key]
            cell.movies = movie
        }
        
        
        //cellua inteira, o fundo
        cell.backgroundColor = .brown
        return cell
    }
}
