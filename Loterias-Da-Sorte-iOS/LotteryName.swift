//
//  LotteryName.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

enum LotteryName: String {
    case megaSena
    case quina
}

extension LotteryName {
    var lotteryGame: LotteryGamesNoSpace {
        switch self {
        case .megaSena:
            return .megasena
        case .quina:
            return .quina
        }
    }
}
