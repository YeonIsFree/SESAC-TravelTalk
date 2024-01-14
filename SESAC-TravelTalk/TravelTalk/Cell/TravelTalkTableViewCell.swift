//
//  TravelTalkTableViewCell.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/14.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configureCell(_ data: ChatRoom) {
        // image
        profileImageView.image = UIImage(named: data.chatroomImage[0])
       
        // title
        titleLabel.text = data.chatroomName
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        // chat
        let lastIndex = data.chatList.count - 1
        let lastChatList = data.chatList[lastIndex]
        chatLabel.text = lastChatList.message
        chatLabel.font = .systemFont(ofSize: 14)
        
        // date
        dateLabel.text = DateFormatter.convertDate(lastChatList.date)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = profileImageView.frame.width
        profileImageView.layer.cornerRadius = imageWidth / 2
        profileImageView.contentMode = .scaleAspectFit
    }
}
