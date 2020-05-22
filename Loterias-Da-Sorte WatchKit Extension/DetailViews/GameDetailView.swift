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
    @ObservedObject var gameDetailRequester = GameDetailRequester()
    
    init(gameDetailData: GameDetail) {
        self.gameDetailData = gameDetailData
        self.gameDetailRequester.lottery = gameDetailData.lottery
    }
    
    var body: some View {
        if let data = self.gameDetailRequester.returnData {
            return AnyView(self.lastOrNextVIew(typeOfGame: self.gameDetailData.typeOfGame, model: data))
            
        }
        return AnyView(Text("Carregando resultados...").onAppear(perform: {
            self.gameDetailRequester.request(lottery: self.gameDetailData.lottery)
        }))
    }
    
    func viewDefinition(lottery: GameDetailModel) -> some View {
        switch lottery.gameData.lotteryGame {
        case .megasena, .quina, .lotofacil, .lotomania:
            return AnyView(FirstStyleTable(game: lottery))
        case .duplasena, .timemania, .diadesorte:
            return AnyView(SecondStyleView(game: lottery))
        case .federal:
            return AnyView(ThirdStyleView(game: lottery))
        }
    }
    
    func lastOrNextVIew(typeOfGame: TypeOfGame, model: GameDetailModel) -> some View {
        switch typeOfGame {
        case .last:
            return AnyView(self.viewDefinition(lottery: model))
        case .next:
            return AnyView(NextGameView(gameModel: model))
        case .settings:
            return AnyView(Text("Erro"))
            
        }
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameDetailData: GameDetail(lottery: .megasena, typeOfGame: .last))
    }
}
