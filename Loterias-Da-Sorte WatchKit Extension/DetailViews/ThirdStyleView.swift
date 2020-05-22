//
//  ThirdStyleView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 18/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct ThirdStyleView: View {
    
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
                Text(self.game.gameData.getFirstNumbers(prize: .first, data: self.game.gameData.federalPrize ?? []))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[2])
                Text(self.game.gameData.getFirstPrize(prize: .first, data: self.game.gameData.federalPrize ?? []))
            }
            
            VStack(alignment: .leading) {
                Text(self.game.headers[3])
                Text(self.game.gameData.getFirstNumbers(prize: .second, data: self.game.gameData.federalPrize ?? []))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[4])
                Text(self.game.gameData.getFirstPrize(prize: .second, data: self.game.gameData.federalPrize ?? []))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[5])
                Text(self.game.gameData.getFirstNumbers(prize: .third, data: self.game.gameData.federalPrize ?? []))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[6])
                Text(self.game.gameData.getFirstPrize(prize: .third, data: self.game.gameData.federalPrize ?? []))
            }
            VStack(alignment: .leading) {
                Text(self.game.headers[7])
                Text(self.game.gameData.getFirstNumbers(prize: .fourth, data: self.game.gameData.federalPrize ?? []))
            }
            Group {
                VStack(alignment: .leading) {
                    Text(self.game.headers[8])
                    Text(self.game.gameData.getFirstPrize(prize: .fourth, data: self.game.gameData.federalPrize ?? []))
                }
                
                VStack(alignment: .leading) {
                    Text(self.game.headers[9])
                    Text(self.game.gameData.getFirstNumbers(prize: .fifth, data: self.game.gameData.federalPrize ?? []))
                }
                VStack(alignment: .leading) {
                    Text(self.game.headers[10])
                    Text(self.game.gameData.getFirstPrize(prize: .fifth, data: self.game.gameData.federalPrize ?? []))
                }
                
                VStack(alignment: .leading) {
                    Text(self.game.headers[11])
                    Text(self.game.gameData.date)
                }
            }
            
        }.foregroundColor(self.game.gameData.lotteryGame.colorFromGame().newColor).navigationBarTitle(self.game.gameData.lotteryGame.rawValue)
    }
    
}

struct ThirdStyleView_Previews: PreviewProvider {
    static var previews: some View {
        let oi = FederalGamePrize(nome: String(), bilhete: String(), valor_total: DoubleIntLottery.int(10000), faixa: 1)
        let oi2 = FederalGamePrize(nome: String(), bilhete: String(), valor_total: DoubleIntLottery.int(10000), faixa: 1)
        let oi3 = FederalGamePrize(nome: String(), bilhete: String(), valor_total: DoubleIntLottery.int(10000), faixa: 1)
        let oi4 = FederalGamePrize(nome: String(), bilhete: String(), valor_total: DoubleIntLottery.int(10000), faixa: 1)
        let oi5 = FederalGamePrize(nome: String(), bilhete: String(), valor_total: DoubleIntLottery.int(10000), faixa: 1)
        let federal = [oi, oi2, oi3, oi4, oi5]
        
        return ThirdStyleView(game: GameDetailModel(gameData: LotteryNetworkingWorker(lotteryGameString: "Federal", lotteryGame: .federal, lotteryGameNoSpace: .federal, concourseNumber: "2020", numbers: [], date: "21/12/1992", accumulatedValue: String(), prize: String(), winners: String(), duplaSenaSecondSetOfNumbers: nil, teamOrDay: nil, duplaSenaTeamOrDayPrize: nil, duplaSenaTeamOrDayWinners: nil, federalPrize: federal, rateioProcessamento: false, acumulou: false, nextGame: NextGameWorker(lotteryGame: .federal, lotteryGameNoSpace: .federal, date: String(), prize: String(), concourseNumber: String())), headers: GameDetailData().federal))
    }
}
