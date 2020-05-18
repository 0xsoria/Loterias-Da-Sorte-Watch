//
//  Lotofacil.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotoFacilLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 15
    var minimumQuantityOfNumbersYouChoose: Int = 15
    var maxQuantityOfNumbersYouChoose: Int = 18
    var quantityOfNumbersAvailable: Int = 25
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
    var nameOfTheGame: LotteryGames = .lotofacil
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .lotofacil
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 15...18
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>? = 11...15
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
}
