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
    var headers: [String] = []
    
    init(gameData: LotteryNetworkingWorker, headers: [String]) {
        self.gameData = gameData
        self.headers = headers
    }
}
extension GameDetailModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.gameData)
        hasher.combine(self.headers)
    }
}
