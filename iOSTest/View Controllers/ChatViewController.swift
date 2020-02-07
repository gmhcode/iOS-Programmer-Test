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
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: https://api.jsonbin.io/b/5d769a01b6d0e614dd190aff/1
     *
     * 3) Parse the chat data using 'Message' model
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
        
        // TODO: Remove test data when we have actual data from the server loaded
        messages?.append(Message(testName: "Mark", withTestMessage: "Hey Guys!"))
        messages?.append(Message(testName:"Kris", withTestMessage:"What's up?"))
        messages?.append(Message(testName:"Eian", withTestMessage:"Hey! :)"))
        messages?.append(Message(testName:"Mark", withTestMessage:"Want to grab some food later?"))
        messages?.append(Message(testName:"Kris", withTestMessage:"Sure, time and place?sadasdasdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdassdasdsadasdasdadasdas"))
        messages?.append(Message(testName:"Eian", withTestMessage:"YAS! I am starving!!!"))
        messages?.append(Message(testName:"Mark", withTestMessage:"1 hr at the Local Burger sound good?"))
        messages?.append(Message(testName:"Kris", withTestMessage:"Sure thing"))
        messages?.append(Message(testName:"Eian", withTestMessage:"See you there :P"))
        
        MessageController.fetchChat { (messages) in
//            print(messages)
            self.messages = messages
            DispatchQueue.main.async {
                self.chatTable.reloadData()
            }
            
        }
        
    
        
        chatTable.reloadData()
    }
    
    // MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
        
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        
        guard let messages = messages else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as? ChatTableViewCell
        
        
//        var cell: ChatTableViewCell? = nil
//        if cell == nil {
//            let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
//            cell = nibs?[0] as? ChatTableViewCell
//        }
        cell?.setCellData(message: messages[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let messages = messages else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return 0}

        return messages.count
    }
    
    // MARK: - UITableViewDelegate
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       tableView.estimatedRowHeight = 50
//       return UITableView.automaticDimension
//    }
    
    // MARK: - IBAction
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
//        let mainMenuViewController = MenuViewController()
//        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    
    
  
    
}






class MessageController {
    
    var messages : [Message] = []
    
    static func fetchChat(completion: @escaping ([Message]?) -> Void) {
        
        guard let baseUrl = URL(string:"https://api.jsonbin.io/b/5d769a01b6d0e614dd190aff/1") else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        URLSession.shared.dataTask(with: baseUrl) { (data, response, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}

            let jsonDecoder = JSONDecoder()
            
            do {

                let topLevelDict = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                let messages = topLevelDict.data
                print(messages)
                completion(messages)
            }catch {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
            }
            
            
        }.resume()
    }
    
    
    
    static func fetchImage(message: Message, completion: @escaping (UIImage?) -> Void) {
         
        
        URLSession.shared.dataTask(with: message.avatarURL) { (data, reponse, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil);return}

                
            let image = UIImage(data: data)
            completion(image)
            
        }.resume()
    }
}


