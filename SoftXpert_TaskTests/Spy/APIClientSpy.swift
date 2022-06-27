//
//  APIClientSpy.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import Foundation
@testable import SoftXpert_Task

class APIClientSpy: APICleintProtocol {
    
    // MARK: - Testing Properties
    
    var isRequestSent = false
    
    // MARK: - Spy Functions
    
    func send<ResponsType>(request: RequestProtocol, compeletion: @escaping (Result<ResponsType, CustomNetworkError>) -> Void) where ResponsType : Model {
        
        isRequestSent = true
    }
}
