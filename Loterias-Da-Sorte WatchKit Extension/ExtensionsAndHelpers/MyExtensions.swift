//
//  MyExtensions.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public extension String {
    func getCurrentDateAndTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        guard let year = components.year else { return " "}
        guard let day = components.day else { return " "}
        guard let month = components.month else { return " "}
        guard let hour = components.hour else { return " "}
        guard let minute = components.minute else { return " "}
        guard let second = components.second else { return " "}
        let result: String = "\(String(describing: year))-\(String(describing: month))-\(String(describing: day))-\(String(describing: hour))-\(String(describing: minute))-\(String(describing: second))"
        
        return result
    }
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        return dateFormatter.string(from: self)
    }
}

