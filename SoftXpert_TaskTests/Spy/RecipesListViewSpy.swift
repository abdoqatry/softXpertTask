//
//  RecipesListViewSpy.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import UIKit
@testable import SoftXpert_Task

class RecipesListViewSpy: RecipesListViewProtocol {
    
    // MARK: - Dependencies
    
    var interactor: RecipesListViewToInteractorProtocol?
    
    // MARK: - Testing Properties
    
    var recipesList: [Recipe.Hits]?
    var recipes: Recipe?
    var error: (title: String, subtitle: String)?
    var isShowingErrorView = false
    var isShowingLoading = false
    
    func showRecipesList(_ recipes: Recipe, _ recipeList: [Recipe.Hits]) {
        self.recipesList = recipeList
        self.recipes = recipes
    }
    
    func showLoading() {
        isShowingLoading = true
    }
    
    func hideLoading() {
        isShowingLoading = false
    }
    
    var retryViewEdgeInsets: UIEdgeInsets?
    
    func showErrorView(title: String, subtitle: String) {
        isShowingErrorView = true
    }
    
    func hideErrorView() {
        isShowingErrorView = false
    }
    
    
    
    
    
    
}
