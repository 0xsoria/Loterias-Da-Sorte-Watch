//
//  SavedGamesList.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 13/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct SavedGamesList: View {
    
    @State private var alert = false
    
    var body: some View {
        NavigationView {
            Text("Lista")
                .navigationBarTitle("Meus Jogos", displayMode: .automatic)
        }.actionSheet(isPresented: self.$alert, content: {
            ActionSheet(title: Text("Deseja salvar algum jogo?"),
                        message: Text("Escolha qual loteria você quer salvar."),
                        buttons: [
                            //adicionar lista de botões para salvar jogos
                        ])
        })
    }
}

struct SavedGamesList_Previews: PreviewProvider {
    static var previews: some View {
        SavedGamesList()
    }
}
