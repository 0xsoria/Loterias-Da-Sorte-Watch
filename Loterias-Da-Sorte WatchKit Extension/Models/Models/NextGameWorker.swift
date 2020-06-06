//
//  NextGameWorker.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct NextGameWorker {
    var lotteryGame: LotteryGames
    var lotteryGameNoSpace: LotteryGamesNoSpace
    var date: String
    var prize: String
    var concourseNumber: String
    
    init(lotteryGame: LotteryGames, lotteryGameNoSpace: LotteryGamesNoSpace, date: String, prize: String, concourseNumber: String) {
        self.lotteryGame = lotteryGame
        self.lotteryGameNoSpace = lotteryGameNoSpace
        self.date = date.lotteryDateFormat()
        self.prize = prize
        self.concourseNumber = concourseNumber
    }
}

extension NextGameWorker: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(concourseNumber)
    }
}
