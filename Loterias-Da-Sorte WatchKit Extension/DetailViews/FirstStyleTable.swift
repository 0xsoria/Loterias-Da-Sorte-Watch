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
        List {
            VStack {
                Text(game.headers[0])
                Text(self.game.gameData.concourseNumber)
            }
            VStack {
                Text(game.headers[1])
                Text(arrayDataStringToStringWithThreeSpaces(content: self.game.gameData.numbers))
            }
            VStack {
                Text(game.headers[2])
                Text(game.gameData.prize)
            }
            VStack {
                Text(game.headers[3])
                Text(game.gameData.winners)
            }
            
            VStack {
                Text(game.headers[4])
                Text(game.gameData.date)
            }
        }
    }
}

struct FirstStyleTable_Previews: PreviewProvider {
    static var previews: some View {
        FirstStyleTable(game: GameDetailModel(gameData: LotteryNetworkingWorker(lotteryGameString: "Mega Sena", lotteryGame: .megasena, lotteryGameNoSpace: .megasena, concourseNumber: "2020", numbers: [], date: String(), accumulatedValue: String(), prize: String(), winners: String(), duplaSenaSecondSetOfNumbers: nil, teamOrDay: nil, duplaSenaTeamOrDayPrize: nil, duplaSenaTeamOrDayWinners: nil, federalPrize: nil, rateioProcessamento: false, acumulou: false), headers: GameDetailData().megaQuinaFacilMania))
    }
}
