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
            Movie(id: 1, imgUrl: "1", title: "Imagem Um", description: "Uma aventura do Barulho"),
            Movie(id: 2, imgUrl: "2", title: "Imagem Dois", description: "Vc vai morrer de rir com as trapalhadas dessa galerinha do barulho que apronta todas"),
            Movie(id: 1, imgUrl: "4", title: "Imagem Um", description: "Uma aventura do Barulho"),
            Movie(id: 2, imgUrl: "3", title: "Imagem Dois", description: "Vc vai morrer de rir com as trapalhadas dessa galerinha do barulho que apronta todas")
        ]),
        1: ("Novidades", [
            Movie(id: 3, imgUrl: "3", title: "Imagem TRES", description: "Ele vai se meter em uma confusão"),
            Movie(id: 4, imgUrl: "4", title: "Imagem QUATRO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 5, imgUrl: "1", title: "Imagem CINCO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 6, imgUrl: "2", title: "Imagem SEIS", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 7, imgUrl: "3", title: "Imagem SETE", description: "Eles juntos irão se envovler em altas aventuras")
        ]),
        2: ("Lançamentos", [
            Movie(id: 3, imgUrl: "4", title: "Imagem TRES", description: "Ele vai se meter em uma confusão"),
            Movie(id: 4, imgUrl: "1", title: "Imagem QUATRO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 5, imgUrl: "2", title: "Imagem CINCO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 6, imgUrl: "3", title: "Imagem SEIS", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 7, imgUrl: "4", title: "Imagem SETE", description: "Eles juntos irão se envovler em altas aventuras")
            ]),
        3: ("Mangas", [
            Movie(id: 3, imgUrl: "1", title: "Imagem TRES", description: "Ele vai se meter em uma confusão"),
            Movie(id: 4, imgUrl: "2", title: "Imagem QUATRO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 5, imgUrl: "3", title: "Imagem CINCO", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 6, imgUrl: "4", title: "Imagem SEIS", description: "Eles juntos irão se envovler em altas aventuras"),
            Movie(id: 7, imgUrl: "1", title: "Imagem SETE", description: "Eles juntos irão se envovler em altas aventuras")
            ]),
    ]
}
