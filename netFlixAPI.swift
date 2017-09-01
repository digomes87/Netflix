//
//  netFlixAPI.swift
//  NetFlix
//
//  Created by Diego Go on 8/27/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//


 //simulando tempo de latencia de internet
import UIKit

class netFlixAPI: NSObject{
    
    
    //criando um objeto nome share
    static let share  = netFlixAPI()
    
    func request(){
        let delay = DispatchTime.now() + .seconds(5)
        
        DispatchQueue.main.asyncAfter(deadline: delay){
            print("tudo certo ate aqui !")
        }
    }
}


