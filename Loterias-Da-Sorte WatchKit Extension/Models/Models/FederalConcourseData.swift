//
//  FederalConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct FederalConcourseData: Codable {
    let nome: String
    let numero_concurso: Int
    let data_concurso: String
    let data_concurso_milliseconds: Int64
    let local_realizacao: String
    let rateio_processamento: Bool
    let premiacao: [FederalGamePrize]
    let concurso_proximo: Int
    let data_proximo_concurso: String?
    let data_proximo_concurso_milliseconds: Int64
    let valor_estimado_proximo_concurso: DoubleIntLottery
    
    func federalWorkerDataToLotteryWorker() -> LotteryNetworkingWorker {
        return LotteryNetworkingWorker(lotteryGameString: "federal",
                                       lotteryGame: .federal,
                                       lotteryGameNoSpace: .federal,
                                       concourseNumber: String(self.numero_concurso),
                                       numbers: [],
                                       date: self.data_concurso,
                                       accumulatedValue: String(),
                                       prize: String(),
                                       winners: String(),
                                       duplaSenaSecondSetOfNumbers: nil,
                                       teamOrDay: nil,
                                       duplaSenaTeamOrDayPrize: nil,
                                       duplaSenaTeamOrDayWinners: nil,
                                       federalPrize: self.premiacao,
                                       rateioProcessamento: self.rateio_processamento,
                                       acumulou: false, nextGame: self.convertToNextGame())
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .federal, lotteryGameNoSpace: .federal, date: self.data_proximo_concurso ?? "Data a ser definida", prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
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

struct FederalGamePrize: Codable, Equatable {
    let nome: String
    let bilhete: String
    let valor_total: DoubleIntLottery
    let faixa: Int
}
