//
//  Federal.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct FederalLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 5
    var minimumQuantityOfNumbersYouChoose: Int = 5
    var maxQuantityOfNumbersYouChoose: Int = 5
    var quantityOfNumbersAvailable: Int = 5
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
    var nameOfTheGame: LotteryGames = .federal
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .federal
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 5...5
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>? = 5...5
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
}
