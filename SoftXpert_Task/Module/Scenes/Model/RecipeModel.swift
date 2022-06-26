//
//  RecipeModel.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import Foundation

struct Recipe: Model {
    let from : Int
    let more : Bool
    let hits: [Hits]
    
    struct Hits : Model{
        let recipe : Result
    }
    struct Result: Model {
        
        let label: String
        let image : String
        let source: String
    }
}
