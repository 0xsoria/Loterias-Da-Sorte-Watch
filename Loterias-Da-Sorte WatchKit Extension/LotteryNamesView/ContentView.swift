//
//  ContentView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let data = ContentViewData()
    private let typeOfGame: TypeOfGame
    
    init(typeOfGame: TypeOfGame) {
        self.typeOfGame = typeOfGame
    }
    
    var body: some View {
        List {
            ForEach(self.data.lotteries, id: \.self) { lottery in
                NavigationLink(destination: GameDetailView(gameDetailData: GameDetail(lottery: lottery, typeOfGame: self.typeOfGame))) {
                    Text(lottery.rawValue)
                }.navigationBarTitle(self.typeOfGame.rawValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(typeOfGame: .last)
    }
}
