//
//  MainLotteryView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

enum GameType {
    case next
    case last
}

struct MainLotteryView: View {
    
    //MARK: - State
    @StateObject var gameResult: GamesResults = GamesResults(service: LotteryNetworkService(networkService: NetworkService()))
    @State private var segmentIndex: GamesPick = .last

    //MARK: - Views
    var body: some View {
        NavigationView {
            List {
                Picker(selection: self.$segmentIndex, label: EmptyView(), content: {
                    ForEach(GamesPick.allCases) { item in
                        Text(item.rawValue).tag(item)
                    }
                }).pickerStyle(SegmentedPickerStyle())
                .onChange(of: segmentIndex, perform: { value in
                    self.gameResult.cleanGames()
                }).frame(height: 50)
                
                if self.segmentIndex == .last {
                    ForEach(self.gameResult.games, id: \.self) { game in
                        NavigationLink(
                            destination: GameDetailView(),
                            label: {
                                MainViewRow(gameDetail: game, isExpanded: self.gameResult.selection.contains(game), tapAction: {
                                    self.gameResult.checkIfRequestOrNot(game: game)
                                }, remove: {
                                    self.gameResult.remove(game: game)
                                }).animation(.linear(duration: 0.4))
                            })
                            
                    }.onAppear(perform: {
                        UITableViewCell.appearance().selectionStyle = .none
                    })
                } else {
                    ForEach(self.gameResult.games, id: \.self) { game in
                        MainNextGameRow(gameDetail: game,
                                        isExpanded: self.gameResult.nextGamesSelection.contains(game),
                                        tapAction: {
                                            self.gameResult.checkIfRequestOrNotForNextGame(game: game)
                                        }, remove: {
                                            self.gameResult.removeNextGame(game: game)
                                        }).animation(.linear(duration: 0.4))
                    }.onAppear(perform: {
                        UITableViewCell.appearance().selectionStyle = .none
                    })
                }
            }.navigationBarTitle("Loterias da Sorte", displayMode: .automatic)
        }.onAppear(perform: {
            self.gameResult.cleanGames()
            UITableViewCell.appearance().selectionStyle = .none
        })
    }
    
    //MARK: - Methods
}

struct MainLotteryView_Previews: PreviewProvider {
    static var previews: some View {
        MainLotteryView()
    }
}
