//
//  GameDetailRequester.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Combine
import Foundation

protocol GameRequesterProtocol {
    var returnData: GameDetailModel? { get set }
    func request(lottery: LotteryGames)
}

final class NextGameDetailRequester: GameRequesterProtocol {
    var returnData: GameDetailModel?
    
    
    private let requester =  Requester()
    private let lottery: LotteryGames
    
    init(lottery: LotteryGames) {
        self.lottery = lottery
    }
    
    func request(lottery: LotteryGames) {
        
    }
    
}
