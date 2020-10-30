//
//  GamesModel.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 18/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

final class GameModel {
    static var allLotteries: [GameDetailModel] = [
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .megasena)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .quina)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .lotofacil)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .lotomania)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .duplasena)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .timemania)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .diadesorte)),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .federal))
    ]
}
