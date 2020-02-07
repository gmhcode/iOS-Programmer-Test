//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Created by HannDev LLC on 9/9/19.
//  Copyright © 2019 HannDev LLC. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1 1) Setup cell to match mockup
     *
     * 1 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var bodyContainerView: UIView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        bodyContainerView.layer.cornerRadius = 10
        bodyContainerView.layer.borderWidth = 1
        bodyContainerView.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 0.88)
//        body.layer.cornerRadius = 10
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        
       
        
        self.header.text = message.username
        self.body.text = message.text
        body.drawText(in: body.frame)
        
        
        MessageController.fetchImage(message: message) { (image) in
            DispatchQueue.main.async {
                
                self.avatarImage.image = image
                self.avatarImage.layer.cornerRadius = self.avatarImage.frame.height / 2
            }
        }
    }
}
 

