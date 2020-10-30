//
//  QuinaConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct QuinaConcourseData: Codable {
    let nome: String
    let numero_concurso: Int
    let data_concurso: String
    let data_concurso_milliseconds: Int64
    let local_realizacao: String
    let rateio_processamento: Bool
    let acumulou: Bool
    let valor_acumulado: DoubleIntLottery
    let dezenas: [String]
    let premiacao: [GamePrize]
    let local_ganhadores: [GameLocal]
    let arrecadacao_total: DoubleIntLottery
    let data_proximo_concurso: String?
    let data_proximo_concurso_milliseconds: Int64
    let valor_estimado_proximo_concurso: DoubleIntLottery
    let valor_acumulado_especial: DoubleIntLottery
    let nome_acumulado_especial: String
    
    func quinaWorkerDataToLotteryWorker() -> LotteryNetworkingWorker {
        let returnWorker = LotteryNetworkingWorker(lotteryGameString: "quina", lotteryGame: .quina,
                                                   lotteryGameNoSpace: .quina,
                                                   concourseNumber: String(numero_concurso),
                                                   numbers: self.dezenas,
                                                   date: self.data_concurso,
                                                   accumulatedValue: self.valor_acumulado.returnString(),
                                                   
                                                   prize: self.prizeSetter(data: self.premiacao,
                                                                           winner: .quina),
                                                   allPrizes: self.premiacao,
                                                   winners: self.winnersSetter(data: self.premiacao, winner: .quina),
                                                   duplaSenaSecondSetOfNumbers: nil,
                                                   teamOrDay: nil,
                                                   duplaSenaTeamOrDayPrize: nil,
                                                   duplaSenaTeamOrDayWinners: nil,
                                                   federalPrize: nil,
                                                   rateioProcessamento: self.rateio_processamento, acumulou: self.acumulou, nextGame: self.convertToNextGame())
        return returnWorker
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .quina, lotteryGameNoSpace: .quina, date: self.data_proximo_concurso ?? "Data a ser definida", prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
    }
    
    enum QuinaWinners: String {
        case quina = "Quina"
        case quadra = "Quadra"
        case terno = "Terno"
        case duque = "Duque"
    }
    
    func getQuinaPrize(data: [GamePrize], winners: QuinaWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return game.valor_total.returnString().convertToDecimal()
        }
        return String()
    }
    
    func setWinners(data: [GamePrize], winners: QuinaWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return String(game.quantidade_ganhadores)
        }
        return String()
    }
    
    func winnersSetter(data: [GamePrize], winner: QuinaWinners) -> String {
        if self.acumulou {
            return "Nenhum ganhador."
        }
        return setWinners(data: data, winners: winner)
    }
    
    func prizeSetter(data: [GamePrize], winner: QuinaWinners) -> String {
        if self.acumulou {
            return "Acumulou - \(self.valor_acumulado.returnString().convertToDecimal())"
        }
        return getQuinaPrize(data: data, winners: winner)
    }
}

