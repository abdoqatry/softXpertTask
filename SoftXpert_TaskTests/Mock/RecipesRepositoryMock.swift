//
//  RecipesRepositoryMock.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import Foundation
@testable import SoftXpert_Task


class RecipesRepositoryMock: RecipesRepositoryProtocol {
    
    // MARK: - Dependencies
    
    var apiClient: APICleintProtocol
    
    init(apiClient: APIClientSpy) {
        self.apiClient = apiClient
    }
    
    // MARK: - Testing Properties
    
    var compeletion: ((Result<Recipe, CustomNetworkError>) -> Void)?
    
    func successResponsStub() -> Recipe {
        RecipesStubs.createArticaleSuccessData()
    }
    
    func simulateGettingEmptySuccessRespons() {
        compeletion?(Result.success(Recipe(from: 0, more: false, hits: [])))
    }
    
    func simulateGettingNonEmptySuccessRespons() {
        compeletion?(Result.success(successResponsStub()))
    }
    
    func simulateGettingErrorRespons() {
        compeletion?(Result.failure(CustomNetworkError.canNotDecodeObject))
    }
    
    func getRecipesList(searchText: String, from: Int, health: String, healthKey: String, compeletion: @escaping (Result<Recipe, CustomNetworkError>) -> Void) {
        self.compeletion = compeletion
    }
    
    
}
