//
//  ChatViewController.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/14.
//

import UIKit

class ChatViewController: UIViewController {
    
    var chatRoomData = ChatRoom(chatroomId: 1, chatroomImage: [""], chatroomName: "")

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        navigationItem.title = chatRoomData.chatroomName
    }
}

 // MARK: - UITableView Delegate

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chatData = chatRoomData.chatList[indexPath.row]
        
        if chatData.user == .user {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatUserTableViewCell", for: indexPath) as? ChatUserTableViewCell else { return UITableViewCell() }
            
            cell.chatData = chatData
            cell.configureChatUserCell()
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatOtherTableViewCell", for: indexPath) as? ChatOtherTableViewCell else { return UITableViewCell() }
            
            cell.chatRoomData = chatRoomData
            cell.chatData = chatRoomData.chatList[indexPath.row]
            
            cell.configureOtherCell()
            
            return cell
        }
    }
}

 // MARK: - Configure Methods

extension ChatViewController {
    func configureTableView() {
        // Delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Xib
        let userXib = UINib(nibName: "ChatUserTableViewCell", bundle: nil)
        tableView.register(userXib, forCellReuseIdentifier: "ChatUserTableViewCell")
        
        let otherXib = UINib(nibName: "ChatOtherTableViewCell", bundle: nil)
        tableView.register(otherXib, forCellReuseIdentifier: "ChatOtherTableViewCell")
    }
}
