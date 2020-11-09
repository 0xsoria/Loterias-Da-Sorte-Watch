//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 05/11/20.
//

import Foundation

struct GameLocal: Codable {
    let local: String
    let cidade: String
    let uf: String
    let quantidade_ganhadores: Int
    let canal_eletronico: Bool
}
