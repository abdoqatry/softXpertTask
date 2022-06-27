//
//  Localization.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//


import Foundation

struct Localization {
    
    enum LocalizationKey: String {
        
        case errorMessageGeneric = "error_message_generic"
        case errorMessageCanNotSendRequest = "error_message_can_not_send_request"
        case errorMessageCanNotReadData = "error_message_can_not_read_data"
        case encounteredProblem = "encountered_problem"
        case recipeleListEmptyData = "recipe_list_empty_data"
    }
    
    static func string(for key: LocalizationKey) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
}

