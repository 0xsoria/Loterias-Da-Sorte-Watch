//
//  Timemania.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct TimeManiaLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 7
    var minimumQuantityOfNumbersYouChoose: Int = 7
    var maxQuantityOfNumbersYouChoose: Int = 10
    var quantityOfNumbersAvailable: Int = 80
    var allNumbers: [String] {
        get {
            var newArray = [String]()
            for i in 1...quantityOfNumbersAvailable {
                newArray.append(String(i))
            }
            return newArray
        }
        set {
            print("")
        }
    }
    var nameOfTheGame: LotteryGames = .timemania
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .timemania
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 10...10
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>? = 3...7
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
}

struct TimeManiaTeam: Codable {
    var team: String
}
