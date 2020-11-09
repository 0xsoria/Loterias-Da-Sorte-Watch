//
//  MockFileName.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 04/11/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public enum MockFileName: String {
    case mega = "SenaLast"
    case quina = "QuinaLast"
    case lotofacil = "LotoFacilLast"
    case lotomania = "LotoManiaLast"
    case dupla = "DuplaSenaLast"
    case time = "TimeLast"
    case dia = "DiaLast"
    case federal = "FederalLast"
    
    public static func fileName(lottery: LotteryGamesNoSpace) -> MockFileName {
        switch lottery {
        case .megasena:
            return .mega
        case .quina:
            return .quina
        case .lotofacil:
            return .lotofacil
        case .lotomania:
            return .lotomania
        case .duplasena:
            return .dupla
        case .timemania:
            return .time
        case .diadesorte:
            return .dia
        case .federal:
            return .federal
        }
    }
}
