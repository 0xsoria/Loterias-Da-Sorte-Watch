//
//  NextGameView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 21/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

struct NextGameView: View {
    
    private let gameModel: GameDetailModel
    
    init(gameModel: GameDetailModel) {
        self.gameModel = gameModel
    }
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Concurso")
                Text(self.gameModel.gameData.nextGame.concourseNumber)
            }
            VStack(alignment: .leading) {
                Text("Data")
                Text(self.gameModel.gameData.nextGame.date)
            }
            VStack(alignment: .leading) {
                Text("Prêmio Estimado")
                Text(self.gameModel.gameData.nextGame.prize)
            }
        }.foregroundColor(self.gameModel.gameData.lotteryGame.colorFromGame().newColor)
        .navigationBarTitle(self.gameModel.gameData.lotteryGame.rawValue)
    }
}
