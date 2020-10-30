//
//  GameDetailResult.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 27/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

final class GameDetailResult: ObservableObject {
    
    private let service: LotteryNetworkServiceable
    @Published var game: GameDetailModel?
    private var backupGame: GameDetailModel?
    
    init(service: LotteryNetworkServiceable) {
        self.service = service
    }
    
    func setBackup(game: GameDetailModel) {
        self.backupGame = game
    }
    
    func getResultsFor(gameNumber: String, and lottery: LotteryGamesNoSpace, completionError: @escaping ((Bool) -> Void)) {
        self.game = nil
        self.service.request(with: gameNumber, lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                self.game = game
            case .failure:
                if let game = self.backupGame {
                    self.game = game
                }
            }
        }
    }
}
