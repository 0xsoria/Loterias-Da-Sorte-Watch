//
//  Quina.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct QuinaLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 5
    var minimumQuantityOfNumbersYouChoose: Int = 5
    var maxQuantityOfNumbersYouChoose: Int = 7
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
    var nameOfTheGame: LotteryGames = .quina
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .quina
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 5...7
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>?
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
}
