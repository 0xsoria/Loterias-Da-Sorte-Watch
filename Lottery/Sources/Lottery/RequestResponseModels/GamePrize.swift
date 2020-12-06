//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 05/11/20.
//

import Foundation

public struct GamePrize: Codable {
    public let nome: String
    public let quantidade_ganhadores: Int
    public let valor_total: DoubleIntLottery
    public let acertos: Int
}
