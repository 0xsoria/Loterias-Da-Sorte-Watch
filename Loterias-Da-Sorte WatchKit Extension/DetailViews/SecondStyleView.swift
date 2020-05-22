//
//  SecondStyleView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 18/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct SecondStyleView: View {
    
    private let game: GameDetailModel
    
    init(game: GameDetailModel) {
        self.game = game
    }
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(self.game.headers[0])
                Text(self.game.gameData.concourseNumber)
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[1])
                Text(arrayDataStringToStringWithThreeSpaces(content: self.game.gameData.numbers))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[2])
                Text(self.game.gameData.prize)
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[3])
                Text(self.game.gameData.winners)
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[4])
                AnyView(self.setTextForTimeAndDay(lottery: self.game.gameData.lotteryGame))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[5])
                Text(self.game.gameData.duplaSenaTeamOrDayPrize ?? String())
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[6])
                Text(self.game.gameData.duplaSenaTeamOrDayWinners ?? String())
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[7])
                Text(self.game.gameData.date)
            }
        }.navigationBarTitle(self.game.gameData.lotteryGame.rawValue).foregroundColor(self.game.gameData.lotteryGame.colorFromGame().newColor)
    }
    
    private func setTextForTimeAndDay(lottery: LotteryGames) -> some View {
        switch lottery {
        case .duplasena:
            return Text(arrayDataStringToStringWithThreeSpaces(content: self.game.gameData.duplaSenaSecondSetOfNumbers ?? []))
        case .diadesorte, .timemania:
            return Text(self.game.gameData.teamOrDay ?? String())
        default:
            return Text("Erro")
        }
    }
}

struct SecondStyleView_Previews: PreviewProvider {
    static var previews: some View {
        SecondStyleView(game: GameDetailModel(gameData: LotteryNetworkingWorker(lotteryGameString: "Dupla Sena", lotteryGame: .duplasena, lotteryGameNoSpace: .duplasena, concourseNumber: "2020", numbers: [], date: "21/12/1992", accumulatedValue: String(), prize: String(), winners: String(), duplaSenaSecondSetOfNumbers: [], teamOrDay: nil, duplaSenaTeamOrDayPrize: String(), duplaSenaTeamOrDayWinners: String(), federalPrize: nil, rateioProcessamento: false, acumulou: false, nextGame: NextGameWorker(lotteryGame: .duplasena, lotteryGameNoSpace: .duplasena, date: String(), prize: String(), concourseNumber: String())), headers: GameDetailData().duplaSena))
    }
}
