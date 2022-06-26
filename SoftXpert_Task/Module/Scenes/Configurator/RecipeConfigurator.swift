//
//  RecipeConfigurator.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//


import UIKit

enum RecipeConfiguratorTypes {
    case listView
}

struct RecipeeConfigurator {
    
    // MARK: - Public Functions
    
    static func asymble(type: RecipeConfiguratorTypes) -> UIViewController {
        switch type {
        case .listView:
            return asymbleRecipesListView()
            
        }
    }
    
    private static func asymbleRecipesListView() -> UIViewController {
        let recipesViewController = RecipeSearchVC()
        let recipesListPresnter = RecipesListPresenter(view: recipesViewController)
        let recipesRepository = RecipesRepository(apiClient: APICleint.shared)
        let recipesListInteractor =  RecipesListInteractor(presenter: recipesListPresnter,
            repository: recipesRepository)
        recipesViewController.interactor = recipesListInteractor
        
        return recipesViewController
    }
    
    
}

