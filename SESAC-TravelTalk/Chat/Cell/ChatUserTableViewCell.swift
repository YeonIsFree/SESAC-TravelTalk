//
//  ChatUserTableViewCell.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/14.
//

import UIKit

class ChatUserTableViewCell: UITableViewCell {
    
    var chatData = Chat(user: .bran, date: "", message: "")
    
    @IBOutlet var messageTextView: UIView!
    @IBOutlet var messageTextLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configureChatUserCell() {
        messageTextView.layer.borderWidth = 0.8
        messageTextView.layer.borderColor = UIColor(named: "gray")?.cgColor
        messageTextView.backgroundColor = .systemGray5
        messageTextView.clipsToBounds = true
        messageTextView.layer.cornerRadius = 10
        
        messageTextLabel.text = chatData.message
        messageTextLabel.font = .systemFont(ofSize: 14)
        messageTextLabel.numberOfLines = 0
        
        dateLabel.text = DateFormatter.convertChatDate(chatData.date)
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
    }
}
