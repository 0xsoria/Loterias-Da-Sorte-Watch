//
//  GameDetailModel.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 21/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public struct GameDetailModel {
    public let gameData: LotteryModel
    public var gameDetailContent: [GameDetail] = []
    public let id = UUID()
    
    public init(gameData: LotteryModel) {
        self.gameData = gameData
        self.gameDetailContent = GameDetailBuilder.buildDetail(of: self)
    }
}

extension GameDetailModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.gameData)
        hasher.combine(self.gameDetailContent)
    }
}

extension GameDetailModel: Identifiable {}
