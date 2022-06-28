//
//  RecipeListProtocol.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import Foundation


// MARK: - View Protocols

protocol RecipesListViewProtocol: RecipesListPresenterToViewProtocol {
    var interactor: RecipesListViewToInteractorProtocol? { get }
}

protocol RecipesListViewToInteractorProtocol {
    func fetchAllRecipes(searchText:String,from:Int,health:String,healthKey:String)
}

// MARK: - Interactor Protocols
protocol RecipesInteractorToRepositoryProtocol {
    func getRecipesList(searchText:String,from:Int,health:String,healthKey:String, compeletion: @escaping (Result<Recipe, CustomNetworkError>) -> Void)
}

protocol RecipesListInteractorProtocol: RecipesListViewToInteractorProtocol {
    var presenter: RecipesListInteractorToPresenterProtocol { get }
    var repository: RecipesInteractorToRepositoryProtocol { get }
}

protocol RecipesListInteractorToPresenterProtocol {
    func didReceiveRecipes(_ recipe: Recipe,_ recipesList: [Recipe.Hits] )
    func didReceiveError(_ error: CustomNetworkError)
    func showLoading()
    func hideLoading()
    func validateHealthFiltter(text:String) -> String
    
}

// MARK: - Repository Protocols

protocol RecipesRepositoryProtocol: RecipesInteractorToRepositoryProtocol {
    var apiClient: APICleintProtocol { get }
}

// MARK: - Presenter Protocols

protocol RecipesListPresenterProtocol: RecipesListInteractorToPresenterProtocol {
    var view: RecipesListPresenterToViewProtocol? { get }
}

protocol RecipesListPresenterToViewProtocol: LoadingViewCapable,ErrorDisplaying{
    func showRecipesList(_ recipes: Recipe,_ recipeList: [Recipe.Hits])
    
}
