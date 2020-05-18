//
//  FirstStyleTable.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct FirstStyleTable: View {
    
    private let game: GameDetailModel
    
    init(game: GameDetailModel) {
        self.game = game
    }
    
    var body: some View {
        List(self.game.headers, id: \.self) { header in
            VStack {
                Text(header)
                    .foregroundColor(self.game.gameData.lotteryGame.colorFromGame().newColor)
                Text(self.game.gameData.concourseNumber)
                    .foregroundColor(self.game.gameData.lotteryGame.colorFromGame().newColor)
            }
            VStack {
                Text(header)
                .foregroundColor(self.game.gameData.lotteryGame.colorFromGame().newColor)
                Text("")
            }
        }
    }
}

struct FirstStyleTable_Previews: PreviewProvider {
    static var previews: some View {
        FirstStyleTable(game: GameDetailModel(gameData: LotteryNetworkingWorker(lotteryGameString: "Mega Sena", lotteryGame: .megasena, lotteryGameNoSpace: .megasena, concourseNumber: "2020", numbers: [], date: String(), accumulatedValue: String(), prize: String(), winners: String(), duplaSenaSecondSetOfNumbers: nil, teamOrDay: nil, duplaSenaTeamOrDayPrize: nil, duplaSenaTeamOrDayWinners: nil, federalPrize: nil, rateioProcessamento: false, acumulou: false), headers: GameDetailData().megaQuinaFacilMania))
    }
}
