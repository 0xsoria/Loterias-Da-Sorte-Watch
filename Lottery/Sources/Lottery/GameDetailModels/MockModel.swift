//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 08/11/20.
//

import Foundation

public struct MockModel {
    public static func mockedData() -> LotteryModel {
        let file = Bundle.main.url(forResource: MockFileName.mega.rawValue, withExtension: "json")!
        let data = try! Data(contentsOf: file)
        let decoded = try! JSONDecoder().decode(SenaConcourseData.self, from: data)
        return decoded.convertToLotteryWorker()
    }
}
