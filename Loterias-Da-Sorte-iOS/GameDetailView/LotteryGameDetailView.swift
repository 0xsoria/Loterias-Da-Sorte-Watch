//
//  GameDetailView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 04/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct LotteryGameDetailView: View {
    
    var game: GameDetailModel
    var onDisappear: (() -> Void)
    
    var body: some View {
        Text(game.gameData.lotteryGameString)
            .onAppear(perform: {
                self.cleanGames()
                print(game)
            })
    }
    
    
    func cleanGames() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onDisappear()
        }
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
