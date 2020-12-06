//
//  GameDetailView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import Network
import SwiftUI

struct GameDetail {
    let lottery: LotteryGames
    let typeOfGame: TypeOfGame
}

struct GameDetailView: View {
    
    private let gameDetailData: GameDetail
    @State var loading = true
    @StateObject var gameDetailRequester = GameDetailRequester(service: LotteryNetworkService(networkService: NetworkService()))
    
    init(gameDetailData: GameDetail) {
        self.gameDetailData = gameDetailData
    }
    
    var newList: some View {
        List {
            ForEach(self.gameDetailRequester.game?.gameDetailContent ?? []) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                    Text(item.content)
                }.foregroundColor(self.gameDetailData.lottery.colorFromGame().newColor)
                .navigationBarTitle(self.gameDetailData.lottery.rawValue)
            }
        }
    }
    
    var nextList: some View {
        Group {
            if let game = self.gameDetailRequester.game {
                NextGameView(gameModel: game)
            } else {
                Text("Erro ao carregar 😩")
            }
        }
    }
    
    var gameDetail: some View {
        Group {
            if self.loading {
                Text("Carregando resultados...").onAppear(perform: {
                    self.gameDetailRequester.getResultsFor(lottery: self.gameDetailData.lottery.convertToLotteryNoSpace(), completionError: { error in
                        self.loading = error
                    })
                })
            } else {
                if self.gameDetailData.typeOfGame == .last {
                    self.newList
                } else {
                    self.nextList
                }
            }
        }
    }
    
    var body: some View {
        gameDetail
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameDetailData: GameDetail(lottery: .megasena, typeOfGame: .last))
    }
}
