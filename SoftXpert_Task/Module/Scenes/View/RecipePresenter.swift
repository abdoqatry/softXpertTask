//
//  RecipePresenter.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import Foundation

class RecipesListPresenter {

    // MARK: - Dependencies
    
    weak var view: RecipesListPresenterToViewProtocol?

    // MARK: - Initializers
    
    init(view: RecipesListPresenterToViewProtocol) {
        self.view = view
    }
    
    
}


extension RecipesListPresenter : RecipesListPresenterProtocol{
    func validateHealthFiltter(text:String) -> String {
        if text == "All" {
            return ""
        }else{
            return "health"
        }
    }
    
    func didReceiveRecipes(_ recipe: Recipe, recipesList: [Recipe.Hits]) {
        if recipe.hits.isEmpty {
            view?.showErrorView(title: "", subtitle: Localization.string(for: .recipeleListEmptyData))
        } else {
            view?.showRecipesList(recipe, recipesList)
        }
    }
    
    func didReceiveError(_ error: CustomNetworkError) {
        view?.showErrorView(title: Localization.string(for: .encounteredProblem), subtitle: error.localizedDescription)
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        view?.hideLoading()
    }
    
    
    
}
