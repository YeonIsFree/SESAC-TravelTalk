//
//  ChatOtherTableViewCell.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/14.
//

import UIKit

class ChatOtherTableViewCell: UITableViewCell {
    
    var chatRoomData = ChatRoom(chatroomId: 1, chatroomImage: [""], chatroomName: "")
    var chatData = Chat(user: .bran, date: "", message: "")
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var otherUserNameLabel: UILabel!
    @IBOutlet var otherMessageView: UIView!
    @IBOutlet var otherMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configureOtherCell() {
        let imageString = chatRoomData.chatroomImage[0]
        profileImageView.image = UIImage(named: imageString)
        
        otherUserNameLabel.text = chatRoomData.chatroomName
        otherUserNameLabel.font = .boldSystemFont(ofSize: 14)
        
        otherMessageView.layer.borderWidth = 0.8
        otherMessageView.layer.borderColor = UIColor(named: "gray")?.cgColor
        otherMessageView.clipsToBounds = true
        otherMessageView.layer.cornerRadius = 10
        
        otherMessageLabel.text = chatData.message
        otherMessageLabel.font = .systemFont(ofSize: 14)
        otherMessageLabel.numberOfLines = 0
        
        dateLabel.text = DateFormatter.convertChatDate(chatData.date)
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
    }

}
