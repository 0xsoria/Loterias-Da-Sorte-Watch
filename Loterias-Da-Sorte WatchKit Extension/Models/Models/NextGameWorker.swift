//
//  NextGameWorker.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct NextGameWorker: LotteryCommonData {
    var lotteryGame: LotteryGames
    var lotteryGameNoSpace: LotteryGamesNoSpace
    var date: String
    var prize: String
    var concourseNumber: String
    
    init(lotteryGame: LotteryGames, lotteryGameNoSpace: LotteryGamesNoSpace, date: String, prize: String, concourseNumber: String) {
        self.lotteryGame = lotteryGame
        self.lotteryGameNoSpace = lotteryGameNoSpace
        self.date = date.lotteryDateFormat()
        self.prize = prize
        self.concourseNumber = concourseNumber
    }
    
    func convertToLottery() -> LotteryProperties {
        switch self.lotteryGameNoSpace {
        case .megasena:
            return MegaSenaLottery()
        case .quina:
            return QuinaLottery()
        case .lotofacil:
            return LotoFacilLottery()
        case .lotomania:
            return LotoManiaLottery()
        case .diadesorte:
            return DiaDeSorteLottery()
        case .timemania:
            return TimeManiaLottery()
        case .federal:
            return FederalLottery()
        case .duplasena:
            return DuplaSenaLottery()
        }
    }
}

extension NextGameWorker: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(concourseNumber)
    }
}

protocol LotteryCommonData {
    var lotteryGame: LotteryGames { get set }
    var lotteryGameNoSpace: LotteryGamesNoSpace { get set }
    var concourseNumber: String { get set }
    var date: String { get set }
    var prize: String { get set }
}

protocol LotteryComplementaryData {
    var numbers: [String] { get set }
    var accumulatedValue: String { get set }
    var winners: String { get set }
    var duplaSenaSecondSetOfNumbers: [String]? { get set }
    var teamOrDay: String? { get set }
    var duplaSenaTeamOrDayPrize: String? { get set }
    var duplaSenaTeamOrDayWinners: String? { get set }
    var federalPrize: [FederalGamePrize]? { get set }
}
