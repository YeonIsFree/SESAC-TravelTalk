//
//  DateFormatter.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/15.
//

import UIKit

extension DateFormatter {
    static func convertDate(_ raw: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let convertedDate = dateFormatter.date(from: raw) else { return "" }
        
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter.string(from: convertedDate)
    }
}

extension DateFormatter {
    static func convertChatDate(_ raw: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko-KR")
        guard let convertedDate = dateFormatter.date(from: raw) else { return "" }
        
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: convertedDate)
    }
}
