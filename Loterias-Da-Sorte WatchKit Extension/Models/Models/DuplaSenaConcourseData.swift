//
//  DuplaSenaConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct DuplaSenaConcourseData: Codable {
    let nome: String
    let numero_concurso: Int
    let data_concurso: String
    let data_concurso_milliseconds: Int
    let local_realizacao: String
    let rateio_processamento: Bool
    let acumulou: Bool
    let valor_acumulado: DoubleIntLottery
    let dezenas: [String]
    let dezenas_2: [String]
    let premiacao: [GamePrize]
    let premiacao_2: [GamePrize]
    let local_ganhadores: [GameLocal]
    let arrecadacao_total: DoubleIntLottery
    let data_proximo_concurso: String
    let data_proximo_concurso_milliseconds: Int
    let valor_estimado_proximo_concurso: DoubleIntLottery
    let valor_acumulado_especial: DoubleIntLottery
    let nome_acumulado_especial: String
    
    func duplasenaWorkerDataToLotteryWorker() -> LotteryNetworkingWorker {
        return LotteryNetworkingWorker(lotteryGameString: "duplasena", lotteryGame: .duplasena, lotteryGameNoSpace: .duplasena, concourseNumber: String(self.numero_concurso), numbers: self.dezenas, date: self.data_concurso, accumulatedValue: self.valor_acumulado.returnString(), prize: self.getDuplaPrize(data: self.premiacao, winners: .sena), winners: self.setWinnersPrize(data: self.premiacao, winners: .sena), duplaSenaSecondSetOfNumbers: self.dezenas_2, teamOrDay: nil, duplaSenaTeamOrDayPrize: self.getDuplaPrize(data: self.premiacao_2, winners: .sena), duplaSenaTeamOrDayWinners: self.setWinnersPrize(data: self.premiacao_2, winners: .sena), federalPrize: nil, rateioProcessamento: self.rateio_processamento, acumulou: self.acumulou)
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .duplasena, lotteryGameNoSpace: .duplasena, date: self.data_proximo_concurso, prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
    }
    
    enum DuplaSenaWinners: String {
        case sena = "Sena"
        case quina = "Quina"
        case quadra = "Quadra"
        case terno = "Terno"
    }
    
    func getDuplaPrize(data: [GamePrize], winners: DuplaSenaWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return game.valor_total.returnString().convertToDecimal()
        }
        return String()
    }
    
    func setWinnersPrize(data: [GamePrize], winners: DuplaSenaWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return String(game.quantidade_ganhadores)
        }
        return String()
    }
}

