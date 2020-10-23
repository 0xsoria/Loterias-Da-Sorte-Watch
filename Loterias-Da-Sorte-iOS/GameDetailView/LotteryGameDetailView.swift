//
//  GameDetailView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 04/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

final class GameDetailResult: ObservableObject {
    
    private let service: LotteryNetworkServiceable
    @Published var game: GameDetailModel?
    
    init(service: LotteryNetworkServiceable) {
        self.service = service
    }
    
    func getResultsFor(gameNumber: String, and lottery: LotteryGamesNoSpace, completionError: @escaping ((Bool) -> Void)) {
        self.service.request(with: gameNumber, lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                self.game = game
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct LotteryGameDetailView: View {
    
    @StateObject var gameResults = GameDetailResult(service: LotteryNetworkService(networkService: NetworkService()))
    @State private var alert = false
    var game: GameDetailModel
    var onDisappear: (() -> Void)
    
    var body: some View {
        
            if self.gameResults.game == nil {
                self.initialList.onAppear(perform: {
                    self.cleanGames()
                    UITableViewCell.appearance().selectionStyle = .none
                }).navigationBarItems(trailing: Button(action: {
                    self.alert.toggle()
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                })).actionSheet(isPresented: self.$alert) {
                    ActionSheet(title: Text("Deseja ver algum jogo específico?"),
                                message: Text("Toque em procurar e digite o número do jogo que você deseja ver"),
                                buttons: [.default(Text("Procurar"),
                                                   action: {
                                                    self.showAlertWithTextField(with: "Digite o número do jogo que você deseja ver", message: nil, placeholder: "Número do jogo", actionTitle: "Procurar", cancelTitle: "Voltar") { number in
                                                        self.searchNewGame(with: number)
                                                    }
                                                   }), .cancel(Text("Cancelar"))])
                }
            } else {
                self.newList.onAppear(perform: {
                    self.cleanGames()
                    UITableViewCell.appearance().selectionStyle = .none
                }).navigationBarItems(trailing: Button(action: {
                    self.alert.toggle()
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                })).actionSheet(isPresented: self.$alert) {
                    ActionSheet(title: Text("Deseja ver algum jogo específico?"),
                                message: Text("Toque em procurar e digite o número do jogo que você deseja ver"),
                                buttons: [.default(Text("Procurar"),
                                                   action: {
                                                    self.showAlertWithTextField(with: "Digite o número do jogo que você deseja ver", message: nil, placeholder: "Número do jogo", actionTitle: "Procurar", cancelTitle: "Voltar") { number in
                                                        self.searchNewGame(with: number)
                                                    }
                                                   }), .cancel(Text("Cancelar"))])
                }
            }
        
    }
    
    var newList: some View {
        List {
            ForEach(self.gameResults.game!.gameDetailContent) { item in
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title).font(.title)
                    Text(item.content).font(.title2)
                }.foregroundColor(self.game.gameData.lotteryGame
                                    .colorFromGame().newColor)
            }
            .navigationBarTitle(game.gameData.lotteryGame.rawValue, displayMode: .automatic)
        }
    }
    
    var initialList: some View {
        List {
            ForEach(self.game.gameDetailContent) { item in
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title).font(.title)
                    Text(item.content).font(.title2)
                }.foregroundColor(self.game.gameData.lotteryGame
                                    .colorFromGame().newColor)
            }
            .navigationBarTitle(game.gameData.lotteryGame.rawValue, displayMode: .automatic)
        }
    }
    
    private func searchNewGame(with number: String) {
        self.gameResults.getResultsFor(gameNumber: number, and: self.game.gameData.lotteryGameNoSpace, completionError: { error in
            print(error)
        })
    }
    
    private func cleanGames() {
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
