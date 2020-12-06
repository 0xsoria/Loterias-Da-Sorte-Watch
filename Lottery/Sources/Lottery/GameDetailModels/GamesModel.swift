//
//  GamesModel.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 18/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public final class GameModel {
    public static var allLotteries: [GameDetailModel] = [
        GameDetailModel(gameData: LotteryModel(game: .megasena)),
        GameDetailModel(gameData: LotteryModel(game: .quina)),
        GameDetailModel(gameData: LotteryModel(game: .lotofacil)),
        GameDetailModel(gameData: LotteryModel(game: .lotomania)),
        GameDetailModel(gameData: LotteryModel(game: .duplasena)),
        GameDetailModel(gameData: LotteryModel(game: .timemania)),
        GameDetailModel(gameData: LotteryModel(game: .diadesorte)),
        GameDetailModel(gameData: LotteryModel(game: .federal))
    ]
}
