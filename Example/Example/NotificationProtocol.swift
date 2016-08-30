//
//  NotificationProtocol.swift
//  SwiftNotificationCenterExample
//
//  Created by Mango on 16/5/5.
//  Copyright © 2016年 Mango. All rights reserved.
//

import UIKit

protocol UpdateTitle: class {
    
    func updateWithNewTitle(title: String)
    
}

protocol UIKeyboardManage {
    func UIKeyboardWillShow(beginFrame: CGRect, endFrame: CGRect)
}


class UIKeyboardSystemNotifictionMediator {
    
    static let mediator = UIKeyboardSystemNotifictionMediator()

    
    @objc func handleKeyboardNotification(notification: NSNotification) {
        guard notification.name == NSNotification.Name.UIKeyboardWillShow
            else { return }
        
        guard let beginFrame = (notification
            .userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        
        guard let endFrame = (notification
            .userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        
        Broadcaster.notify(UIKeyboardManage.self) {
            $0.UIKeyboardWillShow(beginFrame: beginFrame, endFrame: endFrame)
        }
    }
    
    static let register: () = {
        NotificationCenter.default.addObserver(mediator, selector: #selector(handleKeyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }()
    
}
