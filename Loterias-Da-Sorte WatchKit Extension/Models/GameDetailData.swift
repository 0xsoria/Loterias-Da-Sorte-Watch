//
//  GameDetailData.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

struct GameDetailData {
    
    private let gameDetailTitles: [String] = ["Concurso", "Números", "Prêmio", "Data", "Ganhadores"]
    private let nextGamesTitles: [String] = ["Concurso", "Data", "Prêmio Estimado"]
    let megaQuinaFacilMania = ["Concurso", "Dezenas Sorteadas", "Prêmio", "Ganhadores", "Data do Sorteio"]
    
    let duplaSena = ["Concurso", "Dezenas - Primeiro Sorteio", "Prêmio - Primeiro Sorteio", "Ganhadores - Primeiro Sorteio", "Dezenas - Segundo Sorteio", "Prêmio - Segundo Sorteio", "Ganhadores - Segundo Sorteio", "Data do Sorteio"]
    
    let time = ["Concurso", "Dezenas Sorteadas", "Prêmio das Dezenas", "Ganhadores Sete Dezenas", "Time do Coração Sorteado", "Prêmio Time do Coração", "Ganhadores Time do Coração", "Data do Sorteio"]
    
    let dia = ["Concurso", "Dezenas Sorteadas", "Prêmio das Dezenas", "Ganhadores Sete Dezenas", "Mês de Sorte Sorteado", "Prêmio Mês de Sorte", "Ganhadores Mês de Sorte", "Data do Sorteio"]
    
    let federal = ["Concurso", "Bilhete 1", "Valor Pago Bilhete 1", "Bilhete 2", "Valor Pago Bilhete 2", "Bilhete 3", "Valor Pago Bilhete 3", "Bilhete 4", "Valor Pago Bilhete 4", "Bilhete 5", "Valor Pago Bilhete 5", "Data do Sorteio"]
    
}
