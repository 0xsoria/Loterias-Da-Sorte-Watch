//
//  LotofacilConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct LotoFacilConcourseData: Codable {
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
    let valor_acumulado_especial: DoubleIntLottery
    let nome_acumulado_especial: String
    
    func lotoFacilWorkerDataToLotteryWorker() -> LotteryNetworkingWorker {
        return LotteryNetworkingWorker(lotteryGameString: "lotofacil", lotteryGame: .lotofacil, lotteryGameNoSpace: .lotofacil, concourseNumber: String(self.numero_concurso), numbers: self.dezenas, date: self.data_concurso, accumulatedValue: self.valor_acumulado.returnString(), prize: self.getLotoFacilPrize(data: self.premiacao, winners: .quinze), winners: self.setWinners(data: self.premiacao, winners: .quinze), duplaSenaSecondSetOfNumbers: nil, teamOrDay: nil, duplaSenaTeamOrDayPrize: nil, duplaSenaTeamOrDayWinners: nil, federalPrize: nil, rateioProcessamento: self.rateio_processamento, acumulou: self.acumulou)
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .lotofacil, lotteryGameNoSpace: .lotofacil, date: self.data_proximo_concurso, prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
    }
    
    enum LotofacilWinners: String {
        case quinze = "15 Acertos"
        case catorze = "14 Acertos"
        case treze = "13 Acertos"
        case doze = "12 Acertos"
        case onze = "11 Acertos"
    }
    
    func getLotoFacilPrize(data: [GamePrize], winners: LotofacilWinners) -> String {
        for game in data where game.nome == winners.rawValue {
            return game.valor_total.returnString().convertToDecimal()
        }
        return String()
    }
    
    func setWinners(data: [GamePrize], winners: LotofacilWinners) -> String {
        for game in data where game.nome ==  winners.rawValue {
            return String(game.quantidade_ganhadores)
        }
        return String()
    }
}
