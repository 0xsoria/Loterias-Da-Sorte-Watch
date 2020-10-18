//
//  LastGamesResultsInteractor.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import SwiftUI

protocol GamesResultable: ObservableObject {
    var games: [GameDetailModel] { get set }
    func getLastResultsFor(lottery: LotteryGamesNoSpace)
    func requestFromService(lottery: LotteryGamesNoSpace, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void))
    func updatesGames(lottery: GameDetailModel)
}

final class GamesResults: GamesResultable, ObservableObject {

    private let service: LotteryNetworkServiceable
    @Published var returnData: GameDetailModel?
    @Published var games: [GameDetailModel] = GameModel.allLotteries
    @Published var selection: Set<GameDetailModel> = []
    @Published var nextGamesSelection: Set<GameDetailModel> = []
    
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
    
    func cleanGames() {
        self.selection.removeAll()
        self.nextGamesSelection.removeAll()
    }
    
    func removeNextGame(game: GameDetailModel) {
        if self.nextGamesSelection.contains(game) {
            self.nextGamesSelection.remove(game)
        }
    }
    
    func remove(game: GameDetailModel) {
        if self.selection.contains(game) {
            self.selection.remove(game)
        }
    }
    
    func checkIfRequestOrNot(game: GameDetailModel) {
        if self.selection.contains(game) {
            self.selection.remove(game)
        } else {
            self.lotteryRequest(game: game, forGameType: .last)
        }
    }
        
    func checkIfRequestOrNotForNextGame(game: GameDetailModel) {
        if self.nextGamesSelection.contains(game) {
            self.nextGamesSelection.remove(game)
        } else {
            self.lotteryRequest(game: game, forGameType: .next)
        }
    }
    
    private func lotteryRequest(game: GameDetailModel, forGameType: GameType) {
        self.requestFromService(lottery: game.gameData.lotteryGameNoSpace) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let data):
                self.updatesGames(lottery: data)
                if forGameType == .last {
                    self.lotterySelection(data)
                    return
                }
                self.nextLotterySelection(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func lotterySelection(_ lottery: GameDetailModel) {
        if self.selection.contains(lottery) {
            self.selection.remove(lottery)
        } else {
            self.selection.insert(lottery)
        }
    }
    
    func nextLotterySelection(_ lottery: GameDetailModel) {
        if self.nextGamesSelection.contains(lottery) {
            self.nextGamesSelection.remove(lottery)
        } else {
            self.nextGamesSelection.insert(lottery)
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
