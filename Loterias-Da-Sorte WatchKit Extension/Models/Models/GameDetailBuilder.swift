//
//  GameDetailBuilder.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 22/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct GameDetail {
    let title: String
    let content: String
    let id = UUID()
}

extension GameDetail: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.title)
        hasher.combine(self.content)
    }
}

final class GameDetailBuilder {
    
    static func buildDetail(of game: GameDetailModel) -> [GameDetail] {
        
        switch game.gameData.lotteryGame {
        case .megasena:
            return self.megaSenaBuilder(game: game)
        case .quina:
            return self.quinaBuilder(game: game)
        case.lotofacil:
            return self.lotofacilBuilder(game: game)
        case .lotomania:
            return self.lotomaniaBuilder(game: game)
        case .timemania:
            return self.timemaniaBuilder(game: game)
        case .duplasena:
            return self.duplaSenaBuilder(game: game)
        case .diadesorte:
            return self.diaDeSorteBuilder(game: game)
        case .federal:
            return self.federalBuilding(game: game)
        }
    }
    
    private static func federalBuilding(game: GameDetailModel) -> [GameDetail] {
        return [
            GameDetail(title: "Concurso",
                       content: game.gameData.concourseNumber),
            GameDetail(title: "Data",
                       content: game.gameData.date),
            GameDetail(title: "Bilhete 1",
                       content: game.gameData.getFirstNumbers(prize: .first, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Valor Pago - Bilhete 1",
                       content: game.gameData.getFirstPrize(prize: .first, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Bilhete 2",
                       content: game.gameData.getFirstNumbers(prize: .second, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Valor Pago - Bilhete 2",
                       content: game.gameData.getFirstPrize(prize: .second, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Bilhete 3",
                       content: game.gameData.getFirstNumbers(prize: .third, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Valor Pago - Bilhete 3",
                       content: game.gameData.getFirstPrize(prize: .third, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Bilhete 4",
                       content: game.gameData.getFirstNumbers(prize: .fourth, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Valor Pago - Bilhete 4",
                       content: game.gameData.getFirstPrize(prize: .fourth, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Bilhete 5",
                       content: game.gameData.getFirstNumbers(prize: .fifth, data: game.gameData.federalPrize ?? [])),
            GameDetail(title: "Valor Pago - Bilhete 5",
                       content: game.gameData.getFirstPrize(prize: .fifth, data: game.gameData.federalPrize ?? [])),
            
        ]
    }
    
    private static func diaDeSorteBuilder(game: GameDetailModel) -> [GameDetail] {
        return [
            GameDetail(title: "Concurso",
                       content: game.gameData.concourseNumber),
            GameDetail(title: "Data",
                       content: game.gameData.date),
            GameDetail(title: "Dezenas",
                       content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
            GameDetail(title: "Resultado",
                       content: game.gameData.resultChecker()),
            GameDetail(title: "Premiação - 7 Acertos",
                       content: game.gameData.getPrize(named: .sete)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 7 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .sete).numberOfWinners)),
            GameDetail(title: "Premiação - 6 Acertos",
                       content: game.gameData.getPrize(named: .seis)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 6 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .seis).numberOfWinners)),
            GameDetail(title: "Premiação - 5 Acertos",
                       content: game.gameData.getPrize(named: .cinco)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 5 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .cinco).numberOfWinners)),
            GameDetail(title: "Premiação - 4 Acertos",
                       content: game.gameData.getPrize(named: .quatro)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 4 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .quatro).numberOfWinners)),
            GameDetail(title: "Premiação - Mês de Sorte",
                       content: game.gameData.getPrize(named: .mes)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - Mês de Sorte",
                       content: String(game.gameData
                                        .getPrize(named: .mes).numberOfWinners))
            
        ]
    }
    
    private static func duplaSenaBuilder(game: GameDetailModel) -> [GameDetail] {
        return [
            GameDetail(title: "Concurso",
                       content: game.gameData.concourseNumber),
            GameDetail(title: "Data",
                       content: game.gameData.date),
            GameDetail(title: "Dezenas",
                       content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
            GameDetail(title: "Dezenas 2",
                       content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.duplaSenaSecondSetOfNumbers ?? [])),
            GameDetail(title: "Resultado",
                       content: game.gameData.resultChecker()),
            GameDetail(title: "Premiação Primeira Dezena - Sena",
                       content: game.gameData.getPrize(named: .sena)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores Primeira Dezena - Sena",
                       content: String(game.gameData
                                        .getPrize(named: .sena).numberOfWinners)),
            GameDetail(title: "Premiação Primeira Dezena - Quina",
                       content: game.gameData.getPrize(named: .quina)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores Primeira Dezena - Quina",
                       content: String(game.gameData
                                        .getPrize(named: .quina).numberOfWinners)),
            GameDetail(title: "Premiação Primeira Dezena - Quadra",
                       content: game.gameData.getPrize(named: .quadra)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores Primeira Dezena - Quadra",
                       content: String(game.gameData
                                        .getPrize(named: .quadra).numberOfWinners)),
            GameDetail(title: "Premiação Segunda Dezena - Sena",
                       content: game.gameData.getPrize(named: .sena)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores Primeira Dezena - Sena",
                       content: String(game.gameData
                                        .getPrize(named: .sena).numberOfWinners)),
            GameDetail(title: "Premiação Primeira Dezena - Quina",
                       content: game.gameData.getPrize(named: .quina)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores Primeira Dezena - Quina",
                       content: String(game.gameData
                                        .getPrize(named: .quina).numberOfWinners)),
            GameDetail(title: "Premiação Primeira Dezena - Quadra",
                       content: game.gameData.getPrize(named: .quadra)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores Primeira Dezena - Quadra",
                       content: String(game.gameData
                                        .getPrize(named: .quadra).numberOfWinners)),
            
        ]
    }
    
    private static func timemaniaBuilder(game: GameDetailModel) -> [GameDetail] {
        return [
            GameDetail(title: "Concurso",
                       content: game.gameData.concourseNumber),
            GameDetail(title: "Data",
                       content: game.gameData.date),
            GameDetail(title: "Dezenas",
                       content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
            GameDetail(title: "Resultado",
                       content: game.gameData.resultChecker()),
            GameDetail(title: "Premiação - 7 Acertos",
                       content: game.gameData.getPrize(named: .sete)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 7 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .sete).numberOfWinners)),
            GameDetail(title: "Premiação - 6 Acertos",
                       content: game.gameData.getPrize(named: .seis)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 6 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .seis).numberOfWinners)),
            GameDetail(title: "Premiação - 5 Acertos",
                       content: game.gameData.getPrize(named: .cinco)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 5 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .cinco).numberOfWinners)),
            GameDetail(title: "Premiação - 4 Acertos",
                       content: game.gameData.getPrize(named: .quatro)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 4 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .quatro).numberOfWinners)),
            GameDetail(title: "Premiação - Time do Coração",
                       content: game.gameData.getPrize(named: .time)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - Time do Coração",
                       content: String(game.gameData
                                        .getPrize(named: .time).numberOfWinners))
            
        ]
    }
    
    private static func lotomaniaBuilder(game: GameDetailModel) -> [GameDetail] {
        return [
            GameDetail(title: "Concurso",
                       content: game.gameData.concourseNumber),
            GameDetail(title: "Data",
                       content: game.gameData.date),
            GameDetail(title: "Dezenas",
                       content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
            GameDetail(title: "Resultado",
                       content: game.gameData.resultChecker()),
            GameDetail(title: "Premiação - 20 Acertos",
                       content: game.gameData.getPrize(named: .vinte)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 20 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .vinte).numberOfWinners)),
            GameDetail(title: "Premiação - 19 Acertos",
                       content: game.gameData.getPrize(named: .dezenove)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 19 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .dezenove).numberOfWinners)),
            GameDetail(title: "Premiação - 18 Acertos",
                       content: game.gameData.getPrize(named: .dezoito)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 18 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .dezoito).numberOfWinners)),
            GameDetail(title: "Premiação - 17 Acertos",
                       content: game.gameData.getPrize(named: .dezesete)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 17 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .dezesete).numberOfWinners)),
            GameDetail(title: "Premiação - 16 Acertos",
                       content: game.gameData.getPrize(named: .dezeseis)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 16 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .dezeseis).numberOfWinners)),
            GameDetail(title: "Premiação - 15 Acertos",
                       content: game.gameData.getPrize(named: .quinze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 15 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .quinze).numberOfWinners)),
            GameDetail(title: "Premiação - 14 Acertos",
                       content: game.gameData.getPrize(named: .catorze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 14 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .catorze).numberOfWinners)),
            GameDetail(title: "Premiação - 0 Acertos",
                       content: game.gameData.getPrize(named: .zero)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 0 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .zero).numberOfWinners))
        ]
    }
    
    private static func lotofacilBuilder(game: GameDetailModel) -> [GameDetail] {
        return [
            GameDetail(title: "Concurso",
                       content: game.gameData.concourseNumber),
            GameDetail(title: "Data",
                       content: game.gameData.date),
            GameDetail(title: "Dezenas",
                       content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
            GameDetail(title: "Resultado",
                       content: game.gameData.resultChecker()),
            GameDetail(title: "Premiação - 15 Acertos",
                       content: game.gameData.getPrize(named: .quinze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 15 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .quinze).numberOfWinners)),
            GameDetail(title: "Premiação - 14 Acertos",
                       content: game.gameData.getPrize(named: .catorze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 14 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .catorze).numberOfWinners)),
            GameDetail(title: "Premiação - 13 Acertos",
                       content: game.gameData.getPrize(named: .treze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 13 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .treze).numberOfWinners)),
            GameDetail(title: "Premiação - 12 Acertos",
                       content: game.gameData.getPrize(named: .doze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 12 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .doze).numberOfWinners)),
            GameDetail(title: "Premiação - 12 Acertos",
                       content: game.gameData.getPrize(named: .doze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 12 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .doze).numberOfWinners)),
            GameDetail(title: "Premiação - 11 Acertos",
                       content: game.gameData.getPrize(named: .onze)
                        .prize.returnString().convertToDecimal()),
            GameDetail(title: "Quantidade de ganhadores - 11 Acertos",
                       content: String(game.gameData
                                        .getPrize(named: .onze).numberOfWinners))
        ]
    }
    
    private static func quinaBuilder(game: GameDetailModel) -> [GameDetail] {
        return [GameDetail(title: "Concurso",
                           content: game.gameData.concourseNumber),
                GameDetail(title: "Data",
                                   content: game.gameData.date),
                GameDetail(title: "Dezenas",
                           content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
                GameDetail(title: "Resultado",
                           content: game.gameData.resultChecker()),
                GameDetail(title: "Premiação - Quina",
                           content: game.gameData.getPrize(named: .quina)
                            .prize.returnString().convertToDecimal()),
                GameDetail(title: "Quantidade de ganhadores - Quina",
                           content: String(game.gameData
                                            .getPrize(named: .quina).numberOfWinners)),
                GameDetail(title: "Premiação - Quadra",
                           content: game.gameData.getPrize(named: .quadra)
                            .prize.returnString().convertToDecimal()),
                GameDetail(title: "Quantidade de ganhadores - Quadra",
                           content: String(game.gameData
                                            .getPrize(named: .quadra).numberOfWinners)),
                GameDetail(title: "Premiação - Terno",
                           content: game.gameData.getPrize(named: .terno)
                            .prize.returnString().convertToDecimal()),
                GameDetail(title: "Quantidade de ganhadores - Terno",
                           content: String(game.gameData
                                            .getPrize(named: .terno).numberOfWinners)),
                
        ]
    }
    
    private static func megaSenaBuilder(game: GameDetailModel) -> [GameDetail] {
        return [GameDetail(title: "Concurso",
                           content: game.gameData.concourseNumber),
                GameDetail(title: "Data",
                           content: game.gameData.date),
                GameDetail(title: "Dezenas",
                           content: arrayDataStringToStringWithThreeSpaces(content: game.gameData.numbers)),
                GameDetail(title: "Resultado",
                           content: game.gameData.resultChecker()),
                GameDetail(title: "Premiação - Sena",
                           content: game.gameData.getPrize(named: .sena)
                            .prize.returnString().convertToDecimal()),
                GameDetail(title: "Quantidade de ganhadores - Sena",
                           content: String(game.gameData
                                            .getPrize(named: .sena).numberOfWinners)),
                GameDetail(title: "Premiação - Quina",
                           content: game.gameData.getPrize(named: .quina)
                            .prize.returnString().convertToDecimal()),
                GameDetail(title: "Quantidade de ganhadores - Quina",
                           content: String(game.gameData
                                            .getPrize(named: .quina).numberOfWinners)),
                GameDetail(title: "Premiação - Quadra",
                           content: game.gameData.getPrize(named: .quadra)
                            .prize.returnString().convertToDecimal()),
                GameDetail(title: "Quantidade de ganhadores - Quadra",
                           content: String(game.gameData
                                            .getPrize(named: .quadra).numberOfWinners)),
                
                
        ]
        
    }
}
