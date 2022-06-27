//
//  RecipesInterector.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import Foundation

class RecipesListInteractor {
    
    // MARK: - Dependencies
    
    var presenter: RecipesListInteractorToPresenterProtocol
    var repository: RecipesInteractorToRepositoryProtocol
    
    // MARK: - Initializers
    
    init(presenter: RecipesListInteractorToPresenterProtocol,
         repository: RecipesInteractorToRepositoryProtocol) {
        
        self.presenter = presenter
        self.repository = repository
    }
    
    
}

extension RecipesListInteractor: RecipesListInteractorProtocol {

    func fetchAllRecipes(searchText:String,from:Int,health:String,healthKey:String) {
        self.presenter.showLoading()
        let healthValidation  = presenter.validateHealthFiltter(text: health)
        repository.getRecipesList(searchText: searchText, from: from, health: health, healthKey: healthValidation, compeletion:  { [weak self] result in
           switch result {
        case .success(let recipe):
               self?.presenter.didReceiveRecipes(recipe, recipesList: recipe.hits)
        case .failure(let error):
            self?.presenter.didReceiveError(error)
        }
        self?.presenter.hideLoading()
        }
    )}
    


}
