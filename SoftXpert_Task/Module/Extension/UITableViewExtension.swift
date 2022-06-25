//
//  UITableViewExtension.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//


import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(withCellType: T.Type) where T: Reuseable {
        self.register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<Base: UITableViewCell & Reuseable >(forIndexPath indexPath: IndexPath) -> Base {
        if let cell = self.dequeueReusableCell(withIdentifier: Base.reuseIdentifier, for: indexPath) as? Base {
            return cell
        } else {
            fatalError("can not dequeue cell with reusableIdentifier '\(Base.reuseIdentifier)' at indexPath '\(indexPath)'")
        }
    }
}

