//
//  NextGameWorker.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public struct NextGameWorker {
    public let lotteryGame: LotteryGames
    public let lotteryGameNoSpace: LotteryGamesNoSpace
    public let date: String
    public let prize: String
    public let concourseNumber: String
    
    public init(lotteryGame: LotteryGames, lotteryGameNoSpace: LotteryGamesNoSpace, date: String, prize: String, concourseNumber: String) {
        self.lotteryGame = lotteryGame
        self.lotteryGameNoSpace = lotteryGameNoSpace
        self.date = date.lotteryDateFormat()
        self.prize = prize.convertToDecimal()
        self.concourseNumber = concourseNumber
    }
}

extension NextGameWorker: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(concourseNumber)
    }
}
