//
//  GamesPick.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 10/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

enum GamesPick: String, CaseIterable, Identifiable {
    case last = "Último"
    case next = "Próximo"
    
    var id: String {
        self.rawValue
    }
}
