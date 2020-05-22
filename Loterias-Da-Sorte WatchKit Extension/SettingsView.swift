//
//  SettingsView.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 21/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Desenvolvedor")
                Spacer()
                Text("Gabriel Sória Souza")
                Text("soria@soria.dev")
            }
            VStack(alignment: .leading) {
                Text("Site")
                Spacer()
                Text("https://www.loteriasdasorte.app")
            }
            VStack(alignment: .leading) {
                Text("Open Source")
                Spacer()
                Text("https://github.com/0xsoria/Loterias-Da-Sorte-Watch")
            }
            VStack(alignment: .leading) {
                Text("Política de privacidade")
                Spacer()
                Text("https://www.loteriasdasorte.app/politica-de-privacidade")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
