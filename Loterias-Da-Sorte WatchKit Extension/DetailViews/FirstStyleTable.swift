//
//  FirstStyleTable.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

struct FirstStyleTable: View {
    
    private let game: GameDetailModel
    
    init(game: GameDetailModel) {
        self.game = game
    }
    
    var body: some View {
        self.newList
    }
    
    var newList: some View {
        List {
            ForEach(self.game.gameDetailContent) { item in
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(item.title).font(.title)
                    Text(item.content)
                }).foregroundColor(game.gameData.lotteryGame.colorFromGame().newColor)
            }
        }.navigationBarTitle(self.game.gameData.lotteryGame.rawValue)
        .foregroundColor(self.game.gameData.lotteryGame.colorFromGame().newColor)
    }
}
