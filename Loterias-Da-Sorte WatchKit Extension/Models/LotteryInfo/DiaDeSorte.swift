//
//  DiaDeSorte.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct DiaDeSorteLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 7
    var minimumQuantityOfNumbersYouChoose: Int = 7
    var maxQuantityOfNumbersYouChoose: Int = 15
    var quantityOfNumbersAvailable: Int = 31
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
    var nameOfTheGame: LotteryGames = .diadesorte
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .diadesorte
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 7...15
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>? = 4...7
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
}
