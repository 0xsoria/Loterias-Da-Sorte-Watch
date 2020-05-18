//
//  MainView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    private let rowNames: [TypeOfGame] = [.last, .next]
    
    var body: some View {
        List {
            ForEach(self.rowNames, id: \.self) { names in
                NavigationLink(destination: ContentView(typeOfGame: names)) {
                    Text(names.rawValue)
                }.navigationBarTitle("Loterias Da Sorte")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
