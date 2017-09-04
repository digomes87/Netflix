//
//  ViewController.swift
//  NetFlix
//
//  Created by Diego Go on 8/27/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit

class feedMovieViewController: UITableViewController {
    
    let cellId = "CellId"
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
        
        //status bar
        
        //navigationView
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: (navigationController?.navigationBar.frame.width)!, height: (navigationController?.navigationBar.frame.height)! * 0.65))
        
        logo.image = UIImage(named: "logo-splash")
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
        navigationController?.navigationBar.barTintColor =  UIColor.fromHex(value: 0x111111, alpha: 0.5)
        navigationController?.navigationBar.isTranslucent = true
        
        
        //TableView
        tableView.register(FeedMovieCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = UIColor.fromHex(value: 0x222222)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupIndicatorView(){
        //a magia do autolayout
        
        guard let window = UIApplication.shared.keyWindow else {return}
        
        window.addSubview(progress)
        window.bringSubview(toFront: progress)
        
        window.cons(pattern: "H:|[v0]|", views: progress)
        window.cons(pattern: "V:|[v0]|", views: progress)
    }
    
    
    func setupHeaderView(movie: Movie){
        let a = tableView.frame.height
        let h = UIView(frame: CGRect(x: 0, y: 0, width: a, height: a * (7 / 16 ) + 32))
        
        let iv = UIImageView()
        
        //adicionando a imagem
        iv.image = UIImage(named: movie.imgUrl)
        //configurando o apecfill para a imagem nao ficar muito com aquelas destorçao
        iv.contentMode = .scaleToFill
        //configurando bounds
        iv.clipsToBounds =  true
    
        
        
        //criando o titulo e configurando,cor,font,centralizado
//        let lbl =  UILabel()
//        lbl.text = movie.title
//        lbl.backgroundColor = .white
//        lbl.backgroundColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12)
//        lbl.textAlignment = .center
        
      //  lbl.addSubview(lbl)
        h.addSubview(iv)
        

        h.cons(pattern: "V:[v0]", views: iv)
      //  h.cons(pattern: "H:[v0]", views: lbl)
       // h.cons(pattern: "V:[v0]", views: iv, lbl)
        
        return tableView.tableHeaderView = h
        
        
//        let width = tableView.frame.width
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width * ( 9 / 16 ) + 32))
//        
//        let iv = UIImageView()
//        iv.image = UIImage(named: movie.imgUrl)
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
//        iv.backgroundColor = .red
//       // header.addSubview(iv)
//        
//        let lbl = UILabel()
//        lbl.text =  movie.title
//        lbl.textColor = .white
//        lbl.backgroundColor = .black
//        lbl.font = UIFont.boldSystemFont(ofSize: 12)
//        lbl.textAlignment = .center
//        lbl.addSubview(lbl)
//        
//        header.cons(pattern: "H:[v0]", views: iv)
//        header.cons(pattern: "H:[v0]", views: lbl)
//        header.cons(pattern: "V:[v0]", views: iv, lbl)
        
        //tableView.tableHeaderView = header
    }
}

extension feedMovieViewController: FeedMovieDelegate{
    //toda vez q se uma uma extension se deve implemtnar o metodo dela
    func response(status: Int, feed: FeedMovie) {
        progress.removeFromSuperview()
        
        if status == 200 {
            self.feedMovie = feed
            self.setupHeaderView(movie: feed.highlight)
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
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = UIColor.fromHex(value: 0x222222)
        
        if let movieDic = feedMovie?.movie {
            
            let label = UILabel(frame: .zero)
            label.text = movieDic[section]?.0
            label.textColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(label)
            
            var constraints = [NSLayoutConstraint]()
            constraints.append(NSLayoutConstraint(item: label,
                                                  attribute: NSLayoutAttribute.bottom,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: headerView,
                                                  attribute:NSLayoutAttribute.bottom,
                                                  multiplier: 1,
                                                 constant: -4))
            
            
            
            constraints.append(NSLayoutConstraint(item: label,
                                                  attribute: NSLayoutAttribute.left,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: headerView,
                                                  attribute:NSLayoutAttribute.left,
                                                  multiplier: 1,
                                                  constant: 8))
            
            NSLayoutConstraint.activate(constraints)
            

        }
        return headerView
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let width: CGFloat = tableView.frame.width * 0.6
            return  width * (3 / 4)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedMovieCell
        
        
        if let m = feedMovie?.movie{
            //let key = Array(m.keys)[indexPath.section]
            let movie = m[indexPath.section]?.1
            cell.movies = movie
        }
        
        
        
        cell.type = indexPath.section == 0
        //cellua inteira, o fundo
        cell.backgroundColor = .brown
        return cell
    }
}
