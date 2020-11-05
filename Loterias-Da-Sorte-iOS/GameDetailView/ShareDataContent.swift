//
//  ShareDataContent.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 27/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct ShareDataContent {
    let game: LotteryNetworkingWorker
    
    func sharedString(lotteryGame: LotteryGames) -> String {
        switch lotteryGame {
        case .megasena, .quina, .lotofacil, .lotomania:
            let returnString = """
                Resultado do concurso \(self.game.concourseNumber)

                Dezenas: \(arrayDataStringToStringWithThreeSpaces(content: self.game.numbers))

                Premiação: \(self.game.prize)

                Quantidade de ganhadores: \(self.game.winners)

                Baixe o app https://apps.apple.com/us/app/loterias-da-sorte/id1536497809 para mais detalhes.
                """
            return returnString
        case .timemania, .diadesorte, .duplasena:
            let returnString = """
                Resultado do concurso \(self.game.concourseNumber)

                Dezenas: \(arrayDataStringToStringWithThreeSpaces(content: self.game.numbers))

                \(self.specialDataString(game: self.game.lotteryGame)) \(self.game.teamOrDay ?? arrayDataStringToStringWithThreeSpaces(content: self.game.duplaSenaSecondSetOfNumbers ?? []))

                Premiação: \(self.game.prize)

                Quantidade de ganhadores: \(self.game.winners)

                Baixe o app https://apps.apple.com/us/app/loterias-da-sorte/id1536497809 para mais detalhes.
                """
            return returnString
        case .federal:
            let returnString = """
                Resultado do concurso \(self.game.concourseNumber)

                Bilhete 1: \(self.game.getFirstNumbers(prize: .first, data: self.game.federalPrize ?? []))

                Prêmio Bilhete 1: \(self.game.getFirstPrize(prize: .first, data: self.game.federalPrize ?? []))

                Baixe o app https://apps.apple.com/us/app/loterias-da-sorte/id1536497809 para mais detalhes.
                """
            return returnString
        }
    }
    
    private func specialDataString(game: LotteryGames) -> String {
        switch game {
        case .duplasena:
            return "Dezenas 2"
        case .diadesorte:
            return "Mês de Sorte"
        case .timemania:
            return "Time do Coração"
        default:
            return String()
        }
    }
}
