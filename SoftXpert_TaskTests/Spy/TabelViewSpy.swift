//
//  TabelViewSpy.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import UIKit
@testable import SoftXpert_Task

class TableViewSpy: UITableView {
    // MARK: Method call expectations
    
    var reloadDataCalled = false
    
    // MARK: Spied methods
    
    override func reloadData() {
        reloadDataCalled = true
    }
}
