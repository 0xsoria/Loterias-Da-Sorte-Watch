//
//  GameDetailView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct GameDetail {
    let lottery: LotteryGames
    let typeOfGame: TypeOfGame
}

struct GameDetailView: View {
    
    private let gameDetailData: GameDetail
    private var gameResults: GameDetailModel?
    private let gameDetailRequester: GameRequesterProtocol
    
    init(gameDetailData: GameDetail) {
        self.gameDetailData = gameDetailData
        if gameDetailData.typeOfGame == .last {
            gameDetailRequester = GameDetailRequester(lottery: gameDetailData.lottery)
            return
        }
        gameDetailRequester = NextGameDetailRequester(lottery: gameDetailData.lottery)
    }
    
    var body: some View {
        Text("")
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameDetailData: GameDetail(lottery: .megasena, typeOfGame: .last))
    }
}
