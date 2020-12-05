//
//  MainView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    private let rowNames: [TypeOfGame] = [.last, .next, .settings]
    
    var body: some View {
        List {
            ForEach(self.rowNames, id: \.self) { names in
                NavigationLink(destination: self.viewSetter(type: names)) {
                    Text(names.rawValue)
                }.navigationBarTitle("Loterias Da Sorte")
            }
        }
    }
    
    private func viewSetter(type: TypeOfGame) -> some View {
        Group {
            if type == .settings {
                SettingsView()
            } else {
                ContentView(typeOfGame: type)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
