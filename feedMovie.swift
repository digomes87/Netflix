//
//  feedMovie.swift
//  NetFlix
//
//  Created by Diego Go on 8/28/17.
//  Copyright © 2017 Diego Go. All rights reserved.
//

import Foundation

struct Movie{
    var id: Int
    var imgUrl: String
    var title: String?
    var description: String?
}


class FeedMovie{
    let highlight = Movie(id: 1, imgUrl: "highlight" ,title: "Assista agora a Primeira temporada", description: nil)
    
    let movie: [Int: (String, [Movie])] = [
        0: ("Continue Assistindo", [
            Movie(id: 1, imgUrl: "70284281", title: "Imagem Um", description: "Uma aventura do Barulho"),
            Movie(id: 2, imgUrl: "70298966", title: "Imagem Dois", description: "Vc vai morrer de rir com as trapalhadas dessa galerinha do barulho que apronta todas")
        ]),
        1: ("Novidades", [
            Movie(id: 3, imgUrl: "516446", title: "Imagem TRES", description: "Ele vai se meter em uma confusão"),
            Movie(id: 4, imgUrl: "starwars", title: "Imagem QUATRO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 5, imgUrl: "70298966", title: "Imagem CINCO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 6, imgUrl: "starwars", title: "Imagem SEIS", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 7, imgUrl: "70284281", title: "Imagem SETE", description: "Eles juntos irão se envovler em altas aventuras")
        ])
    ]
}
