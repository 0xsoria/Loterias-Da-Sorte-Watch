//
//  LotteryNetworkingWorker.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotteryNetworkingWorker: LotteryCommonData, LotteryComplementaryData {
    
    var lotteryGameString: String
    var lotteryGame: LotteryGames
    var lotteryGameNoSpace: LotteryGamesNoSpace
    var concourseNumber: String
    var numbers: [String]
    var date: String
    var accumulatedValue: String
    var prize: String
    var winners: String
    var duplaSenaSecondSetOfNumbers: [String]?
    var teamOrDay: String?
    var duplaSenaTeamOrDayPrize: String?
    var duplaSenaTeamOrDayWinners: String?
    var federalPrize: [FederalGamePrize]?
    var rateioProcessamento: Bool
    var acumulou: Bool
    var nextGame: NextGameWorker
    
    init(lotteryGameString: String, lotteryGame: LotteryGames, lotteryGameNoSpace: LotteryGamesNoSpace, concourseNumber: String, numbers: [String], date: String, accumulatedValue: String, prize: String, winners: String, duplaSenaSecondSetOfNumbers: [String]?, teamOrDay: String?, duplaSenaTeamOrDayPrize: String?, duplaSenaTeamOrDayWinners: String?, federalPrize: [FederalGamePrize]?, rateioProcessamento: Bool, acumulou: Bool, nextGame: NextGameWorker) {
        self.lotteryGameString = lotteryGameString
        self.lotteryGame = lotteryGame
        self.lotteryGameNoSpace = lotteryGameNoSpace
        self.concourseNumber = concourseNumber
        self.numbers = numbers
        self.date = date.lotteryDateFormat()
        self.accumulatedValue = accumulatedValue
        self.prize = prize.convertToDecimal()
        self.winners = winners
        self.duplaSenaSecondSetOfNumbers = duplaSenaSecondSetOfNumbers
        self.teamOrDay = teamOrDay
        self.duplaSenaTeamOrDayPrize = duplaSenaTeamOrDayPrize?.convertToDecimal()
        self.duplaSenaTeamOrDayWinners = duplaSenaTeamOrDayWinners
        self.federalPrize = federalPrize
        self.rateioProcessamento = rateioProcessamento
        self.acumulou = acumulou
        self.nextGame = nextGame
    }
    
    init() {
        self.lotteryGameString = String()
        self.lotteryGame = .megasena
        self.lotteryGameNoSpace = .megasena
        self.concourseNumber = String()
        self.numbers = []
        self.date = String()
        self.accumulatedValue = String()
        self.prize = String()
        self.winners = String()
        self.rateioProcessamento = false
        self.acumulou = false
        self.nextGame = NextGameWorker(lotteryGame: self.lotteryGame, lotteryGameNoSpace: self.lotteryGameNoSpace, date: self.date, prize: self.prize, concourseNumber: self.concourseNumber)
    }
    
    
    enum FederalPrizes {
        case first
        case second
        case third
        case fourth
        case fifth
    }
    
    func getFirstPrize(prize: FederalPrizes, data: [FederalGamePrize]) -> String {
        switch prize {
        case .first:
            for game in data where game.faixa == 1 {
                return game.valor_total.returnString().convertToDecimal()
            }
        case .second:
            for game in data where game.faixa == 2 {
                return game.valor_total.returnString().convertToDecimal()
            }
        case .third:
            for game in data where game.faixa == 3 {
                return game.valor_total.returnString().convertToDecimal()
            }
        case .fourth:
            for game in data where game.faixa == 4 {
                return game.valor_total.returnString().convertToDecimal()
            }
        case .fifth:
            for game in data where game.faixa == 5 {
                return game.valor_total.returnString().convertToDecimal()
            }
        }
        return String()
    }
    
    func getFirstNumbers(prize: FederalPrizes, data: [FederalGamePrize]) -> String {
        switch prize {
        case .first:
            for game in data where game.faixa == 1 {
                return game.bilhete
            }
        case .second:
            for game in data where game.faixa == 2 {
                return game.bilhete
            }
        case .third:
            for game in data where game.faixa == 3 {
                return game.bilhete
            }
        case .fourth:
            for game in data where game.faixa == 4 {
                return game.bilhete
            }
        case .fifth:
            for game in data where game.faixa == 5 {
                return game.bilhete
            }
        }
        return String()
    }
}

extension LotteryNetworkingWorker: Equatable {
    static func == (lhs: LotteryNetworkingWorker, rhs: LotteryNetworkingWorker) -> Bool {
        return lhs.lotteryGameString == rhs.lotteryGameString   &&
        lhs.lotteryGame == rhs.lotteryGame &&
        lhs.lotteryGameNoSpace == rhs.lotteryGameNoSpace &&
        lhs.concourseNumber == rhs.concourseNumber &&
        lhs.numbers == rhs.numbers &&
        lhs.date == rhs.date &&
        lhs.accumulatedValue == rhs.accumulatedValue &&
        lhs.prize == rhs.prize &&
        lhs.winners == rhs.winners &&
        lhs.duplaSenaSecondSetOfNumbers == rhs.duplaSenaSecondSetOfNumbers &&
        lhs.teamOrDay == rhs.teamOrDay &&
        lhs.duplaSenaTeamOrDayPrize == rhs.duplaSenaTeamOrDayPrize &&
        lhs.duplaSenaTeamOrDayWinners == rhs.duplaSenaTeamOrDayWinners &&
        lhs.federalPrize == rhs.federalPrize
    }
}

extension LotteryNetworkingWorker {
    public func resultChecker() -> String {
        if self.rateioProcessamento {
            return "Apurando resultados..."
        } else if self.acumulou {
            return "ACUMULOU!"
        } else {
            return self.prize
        }
    }
}

extension LotteryNetworkingWorker: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(concourseNumber)
    }
}
