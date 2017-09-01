//
//  NetfliAPI.swift
//  NetFlix
//
//  Created by Diego Go on 8/28/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import UIKit


protocol FeedMovieDelegate {
    func response(status: Int, feed: FeedMovie)
}


class NetFlixAPI: NSObject{
    
    static let share = NetFlixAPI()
    var delegate: FeedMovieDelegate!
    
    func request(){
       let delay = DispatchTime.now() + .seconds(4)
        DispatchQueue.main.asyncAfter(deadline: delay){
            self.delegate.response(status: 200, feed: FeedMovie())
        }
    }
}
