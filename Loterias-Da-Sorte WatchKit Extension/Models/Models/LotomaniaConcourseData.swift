//
//  LotomaniaConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotoManiaConcourseData: Codable {
    let nome: String
    let numero_concurso: Int
    let data_concurso: String
    let data_concurso_milliseconds: Int
    let local_realizacao: String
    let rateio_processamento: Bool
    let acumulou: Bool
    let valor_acumulado: DoubleIntLottery
    let dezenas: [String]
    let premiacao: [GamePrize]
    let local_ganhadores: [GameLocal]
    let arrecadacao_total: DoubleIntLottery
    let data_proximo_concurso: String
    let data_proximo_concurso_milliseconds: Int
    let valor_estimado_proximo_concurso: DoubleIntLottery
    
    func lotomaniaWorkerDataToLotteryWorker() -> LotteryNetworkingWorker {
        return LotteryNetworkingWorker(lotteryGameString: "lotomania", lotteryGame: .lotomania, lotteryGameNoSpace: .lotomania, concourseNumber: String(self.numero_concurso), numbers: self.dezenas, date: self.data_concurso, accumulatedValue: self.valor_acumulado.returnString(), prize: self.getLotomaniaPrize(data: self.premiacao, winners: .vinte), winners: self.setWinners(data: self.premiacao, winners: .vinte), duplaSenaSecondSetOfNumbers: nil, teamOrDay: nil, duplaSenaTeamOrDayPrize: nil, duplaSenaTeamOrDayWinners: nil, federalPrize: nil, rateioProcessamento: self.rateio_processamento, acumulou: self.acumulou)
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .lotomania, lotteryGameNoSpace: .lotomania, date: self.data_proximo_concurso, prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
    }
    
    enum LotomaniaWinners: String {
        case vinte = "20 Acertos"
        case dezenove = "19 Acertos"
        case dezoito = "18 Acertos"
        case dezesete = "17 Acertos"
        case dezeseis = "16 Acertos"
        case quinze = "15 Acertos"
        case zero = "0 Acertos"
    }
    
    func getLotomaniaPrize(data: [GamePrize], winners: LotomaniaWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return game.valor_total.returnString().convertToDecimal()
        }
        return String()
    }
    
    func setWinners(data: [GamePrize], winners: LotomaniaWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return game.valor_total.returnString()
        }
        return String()
    }
}
