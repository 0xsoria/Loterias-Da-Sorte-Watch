//
//  SettingView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    private let actions = SettingsRowActions()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Suporte")) {
                    SettingsViewRow(imageName: "safari", title: "Site", action: self.actions.opensMainWebsite)
                    SettingsViewRow(imageName: "email", title: "E-mail", action: self.actions.sendEmail)
                }
                
                Section(header: Text("Sobre")) {
                    SettingsViewRow(imageName: "bw", title: "Loterias da Sorte", action: self.actions.openAbout)
                    SettingsViewRow(imageName: "bw", title: "Baixe o app para Apple Watch", action: self.actions.downloadWatchApp)
                    SettingsViewRow(imageName: "star", title: "Avalie na App Store", action: self.actions.rateInAppStore)
                    SettingsViewRow(imageName: "terms", title: "Termos de Uso", action: self.actions.openTerms)
                    SettingsViewRow(imageName: "privacy", title: "Política de privacidade", action: self.actions.openPrivacy)
                }
            }.navigationTitle(Text("Informações"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
