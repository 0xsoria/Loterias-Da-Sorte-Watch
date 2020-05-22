//
//  SenaConcourseData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct SenaConcourseData: Codable {
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
    let valor_final_concurso_acumulado: DoubleIntLottery
    let numero_final_concurso_acumulado: DoubleIntLottery
    let valor_acumulado_especial: DoubleIntLottery
    let nome_acumulado_especial: String
    let concurso_especial: Bool
    
    func convertToLotteryWorker() -> LotteryNetworkingWorker {
        return LotteryNetworkingWorker(lotteryGameString: "megasena",
                                       lotteryGame: .megasena,
                                       lotteryGameNoSpace: .megasena,
                                       concourseNumber: String(self.numero_concurso),
                                       numbers: self.dezenas,
                                       date: self.data_concurso,
                                       accumulatedValue: self.valor_acumulado.returnString(),
                                       prize: self.prizeSetter(data: self.premiacao, winner: .sena),
                                       winners: self.winnersSetter(data: self.premiacao, winner: .sena),
                                       duplaSenaSecondSetOfNumbers: nil,
                                       teamOrDay: nil,
                                       duplaSenaTeamOrDayPrize: nil,
                                       duplaSenaTeamOrDayWinners: nil,
                                       federalPrize: nil,
                                       rateioProcessamento: self.rateio_processamento,
                                       acumulou: self.acumulou, nextGame: self.convertToNextGame())
    }
    
    func convertToNextGame() -> NextGameWorker {
        return NextGameWorker(lotteryGame: .megasena, lotteryGameNoSpace: .megasena, date: self.data_proximo_concurso ?? "Data a ser definida", prize: self.valor_estimado_proximo_concurso.returnString(), concourseNumber: String(self.numero_concurso + 1))
    }
    
    enum MegaSenaWinners: String {
        case sena = "Sena"
        case quina = "Quina"
        case quadra = "Quadra"
    }
    
    func getSenaPrize(data: [GamePrize], winner: MegaSenaWinners) -> String {
        for game in data where game.nome == winner.rawValue {
            return game.valor_total.returnString().convertToDecimal()
        }
        return String()
    }
    
    func setWinners(data: [GamePrize], winner: MegaSenaWinners) -> String {
        for game in data where game.nome == winner.rawValue {
            return String(game.quantidade_ganhadores)
        }
        return String()
    }
    
    func winnersSetter(data: [GamePrize], winner: MegaSenaWinners) -> String {
        if self.acumulou {
            return "Nenhum ganhador."
        }
        return setWinners(data: data, winner: winner)
    }
    
    func prizeSetter(data: [GamePrize], winner: MegaSenaWinners) -> String {
        if self.acumulou {
            return "Acumulou - \(self.valor_acumulado.returnString().convertToDecimal())"
        }
        return getSenaPrize(data: data, winner: winner)
    }
}

struct GamePrize: Codable {
    let nome: String
    let quantidade_ganhadores: Int
    let valor_total: DoubleIntLottery
    let acertos: Int
}

struct GameLocal: Codable {
    let local: String
    let cidade: String
    let uf: String
    let quantidade_ganhadores: Int
    let canal_eletronico: Bool
}

enum DoubleIntLottery: Codable, Equatable {
    case int(Int)
    case double(Double)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .int(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        
        throw DecodingError.typeMismatch(DoubleIntLottery.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DoubleIntLottery"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .int(let x):
            try container.encode(x)
        }
    }
    
    func returnString() -> String {
        switch self {
        case .int(let x):
            return String(x)
        case .double(let x):
            return String(x)
        }
    }
}
