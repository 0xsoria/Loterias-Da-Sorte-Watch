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
    private var backupGame: GameDetailModel?
    
    init(service: LotteryNetworkServiceable) {
        self.service = service
    }
    
    func setBackup(game: GameDetailModel) {
        self.backupGame = game
    }
    
    func getResultsFor(gameNumber: String, and lottery: LotteryGamesNoSpace, completionError: @escaping ((Bool) -> Void)) {
        self.game = nil
        self.service.request(with: gameNumber, lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                self.game = game
            case .failure:
                if let game = self.backupGame {
                    self.game = game
                }
            }
        }
    }
}

struct LotteryGameDetailView: View {
    
    @StateObject var gameResults = GameDetailResult(service: LotteryNetworkService(networkService: NetworkService()))
    @State private var alert = false
    @State private var errorLoadingAlert = false
    var game: GameDetailModel
    var onDisappear: (() -> Void)
    
    var body: some View {
        Group {
            if self.gameResults.game != nil {
                self.newList
            } else {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }.onAppear(perform: {
            self.gameResults.setBackup(game: self.game)
            self.searchNewGame(with: game.gameData.concourseNumber)
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
        }.alert(isPresented: self.$errorLoadingAlert, content: {
            Alert(title: Text("Ops!"),
                  message: Text("Erro ao carregar o jogo, tente novamente!"),
                  primaryButton: .default(Text("Tentar novamente"), action: {
                self.searchNewGame(with: self.gameResults.game?.gameData.concourseNumber ?? "")
            }), secondaryButton: .default(Text("Cancelar")))
        })
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
    
    private func searchNewGame(with number: String) {
        self.gameResults.getResultsFor(gameNumber: number, and: self.game.gameData.lotteryGameNoSpace, completionError: { error in
            if error {
                self.errorLoadingAlert = true
            }
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
