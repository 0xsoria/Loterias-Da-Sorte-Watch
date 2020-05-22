//
//  LotteryProperties.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

protocol LotteryProperties {
    var quantityOfNumbersToBeDraw: Int { get set }
    var minimumQuantityOfNumbersYouChoose: Int { get set }
    var maxQuantityOfNumbersYouChoose: Int { get set }
    var quantityOfNumbersAvailable: Int { get set }
    var allNumbers: [String] { get }
    var nameOfTheGame: LotteryGames { get set }
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace { get set }
    var rangeOfNumbersYouChoose: ClosedRange<Int> { get set }
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>? { get set }
    var drawnNumbers: [String]? { get set }
    var councourseNumber: String? { get set }
    var teamOrData: String? { get set }
    var duplaSenaSecondSet: [String]? { get set }
    var federalPrize: FederalGamePrize? { get set }
}


struct Lottery: LotteryProperties {
    
    var quantityOfNumbersToBeDraw: Int
    var minimumQuantityOfNumbersYouChoose: Int
    var maxQuantityOfNumbersYouChoose: Int
    var quantityOfNumbersAvailable: Int
    var allNumbers: [String] {
        get {
            var newArray = [String]()
            if nameOfTheGame == .lotomania {
                for i in 0...quantityOfNumbersAvailable - 1 {
                    newArray.append(String(i))
                }
            } else {
                for i in 1...quantityOfNumbersAvailable {
                    newArray.append(String(i))
                }
            }
            return newArray
        }
        set {
            print("")
        }
    }
    var nameOfTheGame: LotteryGames
    var nameOfTheGameWOSpaces: LotteryGamesNoSpace
    var rangeOfNumbersYouChoose: ClosedRange<Int>
    var quantityOfNumbersNecessaryToWin: ClosedRange<Int>?
    var drawnNumbers: [String]?
    var councourseNumber: String?
    var teamOrData: String?
    var federalPrize: FederalGamePrize?
    var duplaSenaSecondSet: [String]?
    
    init(quantityOfNumbersToBeDraw: Int, minimumQuantityOfNumbersYouChoose: Int, maxQuantityOfNumbersYouChoose: Int, quantityOfNumbersAvailable: Int, nameOfTheGame: LotteryGames, nameOfTheGameWOSpaces: LotteryGamesNoSpace, rangeOfNumbersYouChoose: ClosedRange<Int>, quantityOfNumbersNecessaryToWin: ClosedRange<Int>?, drawnNumbers: [String]?, concourseNumber: String?, teamOrData: String?, duplaSenaSecondSet: [String]?, federalPrize: FederalGamePrize?) {
        
        self.quantityOfNumbersToBeDraw = quantityOfNumbersToBeDraw
        self.minimumQuantityOfNumbersYouChoose = minimumQuantityOfNumbersYouChoose
        self.maxQuantityOfNumbersYouChoose = maxQuantityOfNumbersYouChoose
        self.quantityOfNumbersAvailable = quantityOfNumbersAvailable
        self.nameOfTheGame = nameOfTheGame
        self.nameOfTheGameWOSpaces = nameOfTheGameWOSpaces
        self.rangeOfNumbersYouChoose = rangeOfNumbersYouChoose
        self.quantityOfNumbersNecessaryToWin = quantityOfNumbersNecessaryToWin
        self.drawnNumbers = drawnNumbers
        self.councourseNumber = concourseNumber
        self.teamOrData = teamOrData
        self.duplaSenaSecondSet = duplaSenaSecondSet
        self.federalPrize = federalPrize
    }
}
