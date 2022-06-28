//
//  RecipesListPresenterSpy.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import Foundation
@testable import SoftXpert_Task

class RecipesListPresenterSpy: RecipesListPresenterProtocol {
    
    // MARK: - Testing Properties
    
    var recipesList: [Recipe.Hits]?
    var recipe : Recipe?
    var error: Error?
    var isShowingLoading = false
    
    // MARK: - Dependencies
    
    var view: RecipesListPresenterToViewProtocol?
    
    func didReceiveRecipes(_ recipe: Recipe, _ recipesList: [Recipe.Hits]) {
        self.recipesList = recipesList
        self.recipe = recipe
    }
    
    func didReceiveError(_ error: CustomNetworkError) {
        self.error = error
    }
    
    func showLoading() {
        isShowingLoading = true
    }
    
    func hideLoading() {
        isShowingLoading = false
    }
    
    func validateHealthFiltter(text: String) -> String {
        if text == "All" {
            return ""
        }else{
            return "health"
        }
    }
    




}
