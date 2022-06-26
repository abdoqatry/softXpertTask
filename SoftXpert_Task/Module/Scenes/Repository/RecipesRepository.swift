//
//  RecipesRepository.swift
//  SoftXpert_Task
//
//  Created by Admin on 26/06/2022.
//

import Foundation


struct RecipesRepository {
    
    // MARK: - Dependencies
    
    var apiClient: APICleintProtocol
}


extension RecipesRepository : RecipesRepositoryProtocol {
    func getRecipesList(searchText: String, from: Int, health: String, compeletion: @escaping (Result<Recipe, CustomNetworkError>) -> Void) {
        let request = RecipesRequest.list(from: from, searchText: searchText, healthText: health)
        apiClient.send(request: request, compeletion: compeletion)
    }
    
   
    
    
  
    
}
