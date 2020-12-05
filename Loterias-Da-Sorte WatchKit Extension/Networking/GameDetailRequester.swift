//
//  NextGameDetailRequester.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import Lottery
import Network
import SwiftUI

final class GameDetailRequester: ObservableObject {
    
    private let service: LotteryNetworkServiceable
    @Published var game: GameDetailModel?
    
    init(service: LotteryNetworkServiceable) {
        self.service = service
    }
    
    func getResultsFor(lottery: LotteryGamesNoSpace, completionError: @escaping ((Bool) -> Void)) {
        self.service.request(lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let successData):
                self.game = successData
            completionError(false)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
