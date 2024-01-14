//
//  ViewController.swift
//  SESAC-TravelTalk
//
//  Created by Seryun Chun on 2024/01/14.
//

import UIKit

class TravelTalkViewController: UIViewController {
    
    var chatRoomList = mockChatList
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchTextField: UITextField!
    
     // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configurationSearchBar()
    }
    
    // MARK: - IBAction
    
    @IBAction func searchTextField(_ sender: UITextField) {
        let target = searchTextField.text!  // 찾아야 할 유저 이름
        let rawData = mockChatList          // 원본 채팅방 목록
        var tempList: [ChatRoom] = []       // 임시 빈 배열
        
        // 원본 채팅방 배열을 돌면서 찾아야할 유저를 찾으면 임시 배열에 수집
        for chatRoom in rawData {
            let chatRoomImageList = chatRoom.chatroomImage
            if chatRoomImageList.contains(target) {
                tempList.append(chatRoom)
            }
        }
        
        // 만약 임시 배열이 비어있다면 해당하는 유저를 포함하는 채팅방을 못찾은 것이므로 전체 배열을 전달하고 함수 종료
        if tempList.count == 0 {
            chatRoomList = rawData
            tableView.reloadData()
            return
        }
        
        // 수집한 임시 배열을 클래스 전체에서 사용하는 chatRoomList에 전달
        chatRoomList = tempList
        tableView.reloadData()
    }
}

 // MARK: - UITableView Delegate

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRoomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chatRoomData = chatRoomList[indexPath.row]
        
        if chatRoomData.chatroomImage.count == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTalkTableViewCell", for: indexPath) as? TravelTalkTableViewCell else { return UITableViewCell() }
            
            
            cell.configureCell(chatRoomData)
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell else { return UITableViewCell() }
            
            cell.configureGroupCell(chatRoomData)
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController else { return }
        
        vc.chatRoomData = chatRoomList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

 // MARK: - Configuration Methods

extension TravelTalkViewController {
    func configureTableView() {
        // delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Xib
        let xib = UINib(nibName: "TravelTalkTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelTalkTableViewCell")
        
        let groupXib = UINib(nibName: "GroupTableViewCell", bundle: nil)
        tableView.register(groupXib, forCellReuseIdentifier: "GroupTableViewCell")
    }
    
    func configurationSearchBar() {
        searchView.clipsToBounds = true
        searchView.layer.cornerRadius = 10
    }
}
