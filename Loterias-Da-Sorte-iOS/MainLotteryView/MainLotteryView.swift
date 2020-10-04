//
//  MainLotteryView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct MainLotteryView: View {
    
    @ObservedObject var lastGameResults: LastGamesResultsInteractor
    private let service: LotteryNetworkServiceable
    
    init(service: LotteryNetworkServiceable) {
        self.service = service
        self.lastGameResults = LastGamesResultsInteractor(service: service)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.lastGameResults.games, id: \.self) { game in
                    NavigationLink(destination: GameDetailView()) {
                        Text(game.gameData.lotteryGame.rawValue)
                    }
                }
            }.navigationBarTitle("Loterias da Sorte", displayMode: .large)
        }
    }
}

struct MainLotteryView_Previews: PreviewProvider {
    static var previews: some View {
        MainLotteryView(service:
                            LotteryNetworkService(networkService:
                                                    NetworkService()))
    }
}
