//
//  LotteryNetworkingWorker.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public struct LotteryModel {
    
    public let id = UUID()
    public let lotteryGame: LotteryGames
    public let lotteryGameNoSpace: LotteryGamesNoSpace
    public let concourseNumber: String
    public let numbers: [String]
    public let numbersString: String
    public let date: String
    public let accumulatedValue: String
    public let prize: String
    public let allPrizes: [GamePrize]?
    public let winners: String
    public let duplaSenaSecondSetOfNumbers: [String]?
    public let teamOrDay: String?
    public let duplaSenaTeamOrDayPrize: String?
    public let duplaSenaTeamOrDayWinners: String?
    public let federalPrize: [FederalGamePrize]?
    public let rateioProcessamento: Bool
    public let acumulou: Bool
    public let nextGame: NextGameWorker
    
    public init(lotteryGame: LotteryGames,
         lotteryGameNoSpace: LotteryGamesNoSpace,
         concourseNumber: String,
         numbers: [String],
         date: String,
         accumulatedValue: String,
         prize: String,
         allPrizes: [GamePrize],
         winners: String,
         duplaSenaSecondSetOfNumbers: [String]?,
         teamOrDay: String?,
         duplaSenaTeamOrDayPrize: String?,
         duplaSenaTeamOrDayWinners: String?,
         federalPrize: [FederalGamePrize]?,
         rateioProcessamento: Bool,
         acumulou: Bool,
         nextGame: NextGameWorker) {
        self.lotteryGame = lotteryGame
        self.lotteryGameNoSpace = lotteryGameNoSpace
        self.concourseNumber = concourseNumber
        self.numbers = numbers
        self.numbersString = arrayDataStringToStringWithThreeSpaces(content: numbers)
        self.date = date.lotteryDateFormat()
        self.accumulatedValue = accumulatedValue
        self.prize = prize.convertToDecimal()
        self.allPrizes = allPrizes
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
        self.lotteryGame = .megasena
        self.lotteryGameNoSpace = .megasena
        self.concourseNumber = String()
        self.numbers = []
        self.numbersString = arrayDataStringToStringWithThreeSpaces(content: [])
        self.date = String()
        self.accumulatedValue = String()
        self.prize = String()
        self.allPrizes = []
        self.winners = String()
        self.duplaSenaSecondSetOfNumbers = nil
        self.teamOrDay = nil
        self.duplaSenaTeamOrDayPrize = nil
        self.duplaSenaTeamOrDayWinners = nil
        self.federalPrize = nil
        self.rateioProcessamento = false
        self.acumulou = false
        self.nextGame = NextGameWorker(lotteryGame: self.lotteryGame, lotteryGameNoSpace: self.lotteryGameNoSpace, date: self.date, prize: self.prize, concourseNumber: self.concourseNumber)
    }
    
    init(game: LotteryGames) {
        self.lotteryGame = game
        self.lotteryGameNoSpace = game.convertToLotteryNoSpace()
        self.concourseNumber = String()
        self.numbers = []
        self.numbersString = arrayDataStringToStringWithThreeSpaces(content: [])
        self.date = String()
        self.accumulatedValue = String(0)
        self.prize = String()
        self.allPrizes = []
        self.winners = String()
        self.duplaSenaSecondSetOfNumbers = nil
        self.teamOrDay = nil
        self.duplaSenaTeamOrDayPrize = nil
        self.duplaSenaTeamOrDayWinners = nil
        self.federalPrize = nil
        self.rateioProcessamento = false
        self.acumulou = false
        self.nextGame = NextGameWorker(lotteryGame: game,
                                       lotteryGameNoSpace: game.convertToLotteryNoSpace(),
                                       date: String(),
                                       prize: String(),
                                       concourseNumber: String())
    }
    
    
    public enum FederalPrizes {
        case first
        case second
        case third
        case fourth
        case fifth
    }
    
    public func getFirstPrize(prize: FederalPrizes, data: [FederalGamePrize]) -> String {
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
    
    public func getFirstNumbers(prize: FederalPrizes, data: [FederalGamePrize]) -> String {
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

extension LotteryModel: Equatable {
    public static func == (lhs: LotteryModel, rhs: LotteryModel) -> Bool {
        return lhs.lotteryGame == rhs.lotteryGame &&
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

extension LotteryModel {
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

extension LotteryModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(concourseNumber)
    }
}

extension LotteryModel: Identifiable {}

extension LotteryModel {
    public func getPrize(named: PrizeNames) -> (prize: String, numberOfWinners: Int) {
        if let priezes = self.allPrizes {
            for prize in priezes where prize.nome == named.rawValue {
                return (prize.valor_total.returnString().convertToDecimal(), prize.quantidade_ganhadores)
            }
        }
        return ("0", 0)
    }
}
