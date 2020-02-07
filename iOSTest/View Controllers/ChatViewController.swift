//
//  ChatViewController.swift
//  iOSTest
//
//  Created by HannDev LLC on 9/9/19.
//  Copyright © 2019 HannDev LLC. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1 1) Make the UI look like it does in the mock-up.
     *
     * 1 2) Using the following endpoint, fetch chat data
     *    URL: https://api.jsonbin.io/b/5d769a01b6d0e614dd190aff/1
     *
     * 1 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
//    private var client: ChatClient?
    private var messages: [Message]?
    
    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages = [Message]()
        configureTable(tableView: chatTable)
        
        title = "Chat"

        ChatClient.fetchChatData({ (messages) in
            guard let messages = messages else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

            self.messages = messages
            
            DispatchQueue.main.async {
                self.chatTable.reloadData()
            }
        }, withError: { (error) in
            print(error as Any)
        })
    }
    
    // MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        chatTable.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        
        
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let messages = messages else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as? ChatTableViewCell

        cell?.setCellData(message: messages[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let messages = messages else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return 0}

        return messages.count
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       tableView.estimatedRowHeight = 50
       return UITableView.automaticDimension
    }
    
    // MARK: - IBAction
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        

    }
}









