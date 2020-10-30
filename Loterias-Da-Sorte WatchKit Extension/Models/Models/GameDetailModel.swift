//
//  GameDetailModel.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 21/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct GameDetailModel {
    var gameData: LotteryNetworkingWorker
    var gameDetailContent: [GameDetail] = []
    let id = UUID()
    
    init(gameData: LotteryNetworkingWorker) {
        self.gameData = gameData
        self.gameDetailContent = GameDetailBuilder.buildDetail(of: self)
    }
}

extension GameDetailModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.gameData)
        hasher.combine(self.gameDetailContent)
    }
}

extension GameDetailModel: Identifiable {}

