//
//  SettingsRowActions.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 28/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import UIKit

final class SettingsRowActions {
    func opensMainWebsite() {
        guard let url = URL(string: "https://loteriasdasorte.app") else { return }
        UIApplication.shared.open(url)
    }
    
    func sendEmail() {
        let emailSender = SendEmailHelper()
        emailSender.sendEmail()
    }
    
    func openAbout() {
        guard let url = URL(string: "https://www.loteriasdasorte.app/sobre") else { return }
        UIApplication.shared.open(url)
    }
    
    func downloadWatchApp() {
        guard let url = URL(string: "https://apps.apple.com/br/app/loterias-da-sorte/id1514701643?itsct=apps_box&itscg=30200") else { return }
        UIApplication.shared.open(url)
    }
    
    func rateInAppStore() {
        guard let url = URL(string: "https://apps.apple.com/us/app/loterias-da-sorte/id1536497809") else { return }
        UIApplication.shared.open(url)
    }
    
    func openPrivacy() {
        guard let url = URL(string: "https://www.loteriasdasorte.app/politica-de-privacidade") else { return }
        UIApplication.shared.open(url)
    }
    
    func openTerms() {
        guard let url = URL(string: "https://www.loteriasdasorte.app/termos-de-uso") else { return }
        UIApplication.shared.open(url)
    }
}
