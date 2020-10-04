//
//  LastGamesResultsInteractor.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import SwiftUI

protocol LastGamesResultable: ObservableObject {
    var games: [GameDetailModel] { get set }
    func getLastResultsFor(lottery: LotteryGamesNoSpace)
}

final class LastGamesResultsInteractor: LastGamesResultable, ObservableObject {

    private let service: LotteryNetworkServiceable
    @Published var returnData: GameDetailModel?
    @Published var games: [GameDetailModel] = GameModel.allLotteries

    init(service: LotteryNetworkServiceable) {
        self.service = service
    }

    func getLastResultsFor(lottery: LotteryGamesNoSpace) {
        self.requestFromService(lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let successData):
                self.returnData = successData
                self.updatesGames(lottery: successData)
            case .failure(let failureData):
                print(failureData)
            }
        }
    }
    
    func requestFromService(lottery: LotteryGamesNoSpace, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
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
