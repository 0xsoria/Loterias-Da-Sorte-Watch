//
//  MegaSena.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct MegaSenaLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 6
    var minimumQuantityOfNumbersYouChoose: Int = 6
    var maxQuantityOfNumbersYouChoose: Int = 15
    var quantityOfNumbersAvailable: Int = 60
    var allNumbers: [String] {
        get {
            var newArray = [String]()
            for i in 1...quantityOfNumbersAvailable {
                newArray.append(String(i))
            }
            return newArray
        }
        set {
            print(newValue)
        }
    }
    var nameOfTheGame: LotteryGames = .megasena
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .megasena
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 6...15
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>?
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
}
