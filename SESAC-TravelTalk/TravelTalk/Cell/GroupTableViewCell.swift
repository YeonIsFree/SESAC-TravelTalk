//
//  GroupTableViewCell.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/15.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet var groupProfileImages: [UIImageView]!
    @IBOutlet var groupTitleLabel: UILabel!
    @IBOutlet var groupChatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configureGroupCell(_ data: ChatRoom) {
        // image
        let imageList = data.chatroomImage
        for index in 0..<imageList.count {
            groupProfileImages[index].image = UIImage(named: imageList[index])
        }
        
        // title
        groupTitleLabel.text = data.chatroomName
        groupTitleLabel.font = .boldSystemFont(ofSize: 16)
        
        // chat
        let lastIndex = data.chatList.count - 1
        let lastChatList = data.chatList[lastIndex]
        groupChatLabel.text = lastChatList.message
        groupChatLabel.font = .systemFont(ofSize: 14)
        
        // date
        dateLabel.text = DateFormatter.convertDate(lastChatList.date)
    }
}
