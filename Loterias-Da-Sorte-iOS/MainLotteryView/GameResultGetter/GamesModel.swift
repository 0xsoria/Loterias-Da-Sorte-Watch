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
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .megasena),
                        headers: GameDetailData().megaQuinaFacilMania),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .quina), headers: GameDetailData().megaQuinaFacilMania),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .lotofacil), headers: GameDetailData().megaQuinaFacilMania),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .lotomania), headers: GameDetailData().megaQuinaFacilMania),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .duplasena), headers: GameDetailData().duplaSena),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .timemania), headers: GameDetailData().time),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .diadesorte), headers: GameDetailData().dia),
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .federal), headers: GameDetailData().federal)
    ]
}
