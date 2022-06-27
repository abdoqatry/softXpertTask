//
//  Stubs.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import Foundation
@testable import SoftXpert_Task

class RecipesStubs {
    
    static func createRecipsArray()-> [Recipe.Hits]{
        let recipeMeat =  Recipe.hits(label: "meat", image: "meatImage", source: "meatSource")
        let recipeChicken =  Recipe.hits(label: "chicken", image: "chickenImage", source: "chickenSource")
        return [
              Recipe.Hits(recipe: recipeMeat),
              Recipe.Hits(recipe: recipeChicken)
        ]
    }
    
    static func createArticaleSuccessData() -> Recipe {
        return Recipe(from: 0, more: false, hits: createRecipsArray())
    }
    
}
