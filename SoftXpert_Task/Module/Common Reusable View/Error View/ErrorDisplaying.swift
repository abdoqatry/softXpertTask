//
//  ErrorDisplaying.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import UIKit

@objc
protocol Retriable {
    @objc optional func retry()
}

protocol ErrorDisplaying: Retriable {
    
    var retryViewEdgeInsets: UIEdgeInsets? { get }
    func showErrorView( subtitle: String,selfDismissing:Bool)
}

extension ErrorDisplaying where Self: UIViewController {
    
    var retryViewEdgeInsets: UIEdgeInsets? {
        return UIEdgeInsets.zero
    }
    
    func showErrorView( subtitle: String,selfDismissing:Bool) {
        
        showAlert(title: subtitle, selfDismissing: selfDismissing)
    }
 
}

