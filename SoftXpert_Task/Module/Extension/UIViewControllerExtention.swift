//
//  UIViewControllerExtention.swift
//  SoftXpert_Task
//
//  Created by Admin on 27/06/2022.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    func showAlert(title : String,selfDismissing: Bool) {

        let messageContent = ""
        let alert = UIAlertController(title: title, message: messageContent, preferredStyle: .alert)


        if !selfDismissing {
            let title = NSLocalizedString("موافق", comment: "Any")
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
        }
        present(alert, animated: true)

        if selfDismissing {
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                alert.dismiss(animated: true)
            } }
    }
    
}

