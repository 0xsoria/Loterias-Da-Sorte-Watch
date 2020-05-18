//
//  Lotomania.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotoManiaLottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int = 20
    var minimumQuantityOfNumbersYouChoose: Int = 50
    var maxQuantityOfNumbersYouChoose: Int = 50
    var quantityOfNumbersAvailable: Int = 100
    var allNumbers: [String] {
        get {
            var newArray = [String]()
            for i in 0...quantityOfNumbersAvailable - 1 {
                newArray.append(String(i))
            }
            return newArray
        }
        set {
            print("")
        }
    }
    
    var nameOfTheGame: LotteryGames = .lotomania
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace = .lotomania
    var rangeOfNumbersYouChoose: ClosedRange<Int> = 50...50
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>? = 15...20
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var duplaSenaSecondSet: [String]?
    var federalPrize: FederalGamePrize?
    
}
