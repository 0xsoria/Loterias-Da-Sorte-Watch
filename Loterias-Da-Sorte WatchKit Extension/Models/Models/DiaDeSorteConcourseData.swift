//
//  DiaDeSorteConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct DiaDeSorteConcourseData: Codable {
    let nome: String
    let numero_concurso: Int
    let data_concurso: String
    let data_concurso_milliseconds: Int64
    let local_realizacao: String
    let rateio_processamento: Bool
    let acumulou: Bool
    let valor_acumulado: DoubleIntLottery
    let dezenas: [String]
    let nome_mes_sorte: String
    let dezena_mes_sorte: String
    let premiacao: [GamePrize]
    let local_ganhadores: [GameLocal]
    let arrecadacao_total: DoubleIntLottery
    let data_proximo_concurso: String?
    let data_proximo_concurso_milliseconds: Int64
    let valor_estimado_proximo_concurso: DoubleIntLottery
    
    func diadesorteWorkerDataToLotteryWorker() -> LotteryNetworkingWorker {
        return LotteryNetworkingWorker(lotteryGameString: "diadesorte",
                                       lotteryGame: .diadesorte,
                                       lotteryGameNoSpace: .diadesorte,
                                       concourseNumber: String(self.numero_concurso),
                                       numbers: self.dezenas,
                                       date: self.data_concurso,
                                       accumulatedValue: self.valor_acumulado.returnString(),
                                       prize: self.prizeSetter(data: self.premiacao,
                                                               winner: .sete),
                                       allPrizes: self.premiacao,
                                       winners: self.winnersSetter(data: self.premiacao, winner: .sete),
                                       duplaSenaSecondSetOfNumbers: nil,
                                       teamOrDay: self.nome_mes_sorte,
                                       duplaSenaTeamOrDayPrize: self.setDiaDeSortePrize(data: self.premiacao),
                                       duplaSenaTeamOrDayWinners: self.setMesDeSorteWinners(data: self.premiacao),
                                       federalPrize: nil,
                                       rateioProcessamento: self.rateio_processamento,
                                       acumulou: self.acumulou, nextGame: self.convertToNextGame())
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .diadesorte, lotteryGameNoSpace: .diadesorte, date: self.data_proximo_concurso ?? "Data a ser definida", prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
    }
    
    enum DiaDeSorteWinners: String {
        case sete = "7 Acertos"
        case seis = "6 Acertos"
        case cinco = "5 Acertos"
        case quatro = "4 Acertos"
    }
    
    func setDiaDeSortePrize(data: [GamePrize], winners: DiaDeSorteWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return game.valor_total.returnString().convertToDecimal()
        }
        return String()
    }
    
    func setWinners(data: [GamePrize], winners: DiaDeSorteWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return String(game.quantidade_ganhadores)
        }
        return String()
    }
    
    func setMesDeSorteWinners(data: [GamePrize]) -> String {
        for game in data where game.nome == "Mês da Sorte" {
            return String(game.quantidade_ganhadores)
        }
        return String()
    }
    
    func setDiaDeSortePrize(data: [GamePrize]) -> String {
        for game in data where game.nome == "Mês da Sorte" {
            return String(game.valor_total.returnString().convertToDecimal())
        }
        return String()
    }
    
    func winnersSetter(data: [GamePrize], winner: DiaDeSorteWinners) -> String {
        if self.acumulou {
            return "Nenhum ganhador."
        }
        return setWinners(data: data, winners: winner)
    }
    
    func prizeSetter(data: [GamePrize], winner: DiaDeSorteWinners) -> String {
        if self.acumulou {
            return "Acumulou - \(self.valor_acumulado.returnString().convertToDecimal())"
        }
        return setDiaDeSortePrize(data: data, winners: winner)
    }
}
