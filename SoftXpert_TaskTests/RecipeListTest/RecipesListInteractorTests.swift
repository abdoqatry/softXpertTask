//
//  RecipesListInteractorTests.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import XCTest
@testable import SoftXpert_Task

class RecipesListInteractorTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: RecipesListInteractor!
    var repository: RecipesRepositoryMock!
    var presenter: RecipesListPresenterSpy!
    var apiClientSpy: APIClientSpy!
    
    // MARK: - Life Cycle Functions
    
    override func setUp() {
        super.setUp()
        
        apiClientSpy = APIClientSpy()
        repository = RecipesRepositoryMock(apiClient: apiClientSpy)
        presenter = RecipesListPresenterSpy()
        sut = RecipesListInteractor(presenter: presenter,
                                   repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        repository = nil
        presenter = nil
        apiClientSpy = nil
        sut = nil
    }
    
    // MARK: - Tests
    
    func test_init() {
        // Given
        repository = RecipesRepositoryMock(apiClient: APIClientSpy())
        presenter = RecipesListPresenterSpy()
        
        // When
        sut = RecipesListInteractor(presenter: presenter,
                                   repository: repository)
        // Then
        XCTAssertNotNil(sut.presenter)
        XCTAssertNotNil(sut.repository)
    }
    
    func test_fetchAllRecipes_nonEmptySuccess() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        repository.simulateGettingNonEmptySuccessRespons()
        // then
        XCTAssertFalse(presenter.recipesList?.isEmpty ?? true)
    }
    
    func test_fetchAllRecipes_emptySuccess() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        repository.simulateGettingEmptySuccessRespons()
        // then
        XCTAssertTrue(presenter.recipesList?.isEmpty ?? true)
    }
    
    func test_fetchAllRecipes_failure() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        repository.simulateGettingErrorRespons()
        // then
        XCTAssertNotNil(presenter.error)
    }
    
    func test_fetchAllRecipes_shouldShowLoadingBeforResponse() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        // then
        XCTAssertTrue(presenter.isShowingLoading)
    }
    
    func test_fetchAllRecipes_shouldHideLoadingAfterSuccessResponse() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        repository.simulateGettingEmptySuccessRespons()
        // then
        XCTAssertFalse(presenter.isShowingLoading)
    }
    
    func test_fetchAllRecipes_shouldHideLoadingAfterFailureResponse() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        repository.simulateGettingErrorRespons()
        // then
        XCTAssertFalse(presenter.isShowingLoading)
    }
    
    func test_fetchAllRecipes_shouldTriggerApiClient() {
        // when
        sut.fetchAllRecipes(searchText: "Chicken", from: 1, health: "vegan", healthKey: "health")
        // then
        XCTAssertNotNil(apiClientSpy.isRequestSent)
    }
}
