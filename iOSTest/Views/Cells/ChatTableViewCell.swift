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
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        
        header.text = message.username
        body.text = message.text
       
        
        
//        bo
//        body.layer.borderWidth = 10
//        body.layer.borderColor = #colorLiteral(red: 0.9410712123, green: 0.9412357211, blue: 0.9410731196, alpha: 1)
    }
}
