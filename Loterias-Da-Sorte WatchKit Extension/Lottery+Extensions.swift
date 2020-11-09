//
//  Lottery+Extensions.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 05/11/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

extension LotteryColor {
        @available(iOS 13.0, *)
        public var newColor: Color {
            switch self {
            case .megasena:
                return Color.init(self.color)
            case .quina:
                return Color.init(self.color)
            case .lotofacil:
                return Color.init(self.color)
            case .lotoMania:
                return Color.init(self.color)
            case .timeMania:
                return Color.init(self.color)
            case .duplaSena:
                return Color.init(self.color)
            case .whiteGray:
                return Color.init(self.color)
            case .diaDeSorte:
                return Color.init(self.color)
            case .federal:
                return Color.init(self.color)
            case .defaultText:
                return Color.black
            }
        }
}
