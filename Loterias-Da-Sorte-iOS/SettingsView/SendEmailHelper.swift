//
//  SendEmailHelper.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 28/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//


import MessageUI

final class SendEmailHelper: NSObject, MFMailComposeViewControllerDelegate {
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["soria@soria.dev"])
            
            if let viewController = mail.topMostViewController() {
                viewController.present(mail, animated: true, completion: nil)
            }
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
