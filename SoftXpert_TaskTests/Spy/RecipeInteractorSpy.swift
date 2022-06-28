//
//  RecipeInteractorSpy.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import UIKit
@testable import SoftXpert_Task

class RecipeListInteractorSpy: RecipesListViewToInteractorProtocol {
    
    // MARK: Method call expectations
    
    var getRecipeListCalled = false
    
    // MARK: - Dependencies
    var presenter: RecipesListInteractorToPresenterProtocol?
    var repository: RecipesInteractorToRepositoryProtocol?
    
    
    // MARK: Spied methods
    
    func fetchAllRecipes(searchText: String, from: Int, health: String, healthKey: String) {
        getRecipeListCalled = true
    }
    
    
    
    
}
