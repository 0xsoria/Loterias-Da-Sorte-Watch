//
//  LastGamesResultsInteractor.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import SwiftUI

protocol LastGamesResultable {
    var games: [GameDetailModel] { get set }
    func getLastResultsFor(lottery: LotteryName)
}

final class LastGamesResultsInteractor: LastGamesResultable, ObservableObject {

    private let service: LotteryNetworkServiceable
    @Published var returnData: GameDetailModel?
    var games: [GameDetailModel] = GameModel.allLotteries

    init(service: LotteryNetworkServiceable) {
        self.service = service
    }

    func getLastResultsFor(lottery: LotteryName) {
        self.requestFromService(lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let successData):
                self.returnData = successData
                print(successData)
            case .failure(let failureData):
                print(failureData)
            }
        }
    }
    
    func requestFromService(lottery: LotteryName, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        self.service.request(lottery: lottery, completion: completion)
    }
    
    func updatesGames(lottery: GameDetailModel) {
        for (index, game) in self.games.enumerated() where game.gameData.lotteryGame == lottery.gameData.lotteryGame {
            self.games[index] = lottery
        }
    }
}

final class GameModel {
    static var allLotteries: [GameDetailModel] = [
        GameDetailModel(gameData: LotteryNetworkingWorker(game: .megasena),
                        headers: GameDetailData().megaQuinaFacilMania)
    ]
}
