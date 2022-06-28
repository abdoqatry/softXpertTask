//
//  RecipeListPresnterTests.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import XCTest
@testable import SoftXpert_Task

class RecipesListPresnterTests: XCTestCase {

    // MARK: - Properties
    
    var sut: RecipesListPresenter!
    var view: RecipesListViewSpy!
    var tableViewSpy : TableViewSpy!
    
    // MARK: - Life Cycle Functions
    
    override func setUp() {
        super.setUp()
        
        view = RecipesListViewSpy()
        sut = RecipesListPresenter(view: view)
        tableViewSpy = TableViewSpy()
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        view = nil
        sut = nil
    }
    
    func test_init() {
        // Given
        view = RecipesListViewSpy()
        // When
        sut = RecipesListPresenter(view: view)
        // Then
        XCTAssertNotNil(sut.view)
    }
    
    func test_didReceiveRecipes_notEmpty() {
        // Given
        let recipesList = RecipesStubs.createRecipsArray()
        let recipes = RecipesStubs.createRecip()
        // When
        sut.didReceiveRecipes(recipes, recipesList)
        // Then
        XCTAssertFalse(view.recipesList?.isEmpty ?? true)
    }
    
    func test_didReceiveRecipes_dataShouldMatch() {
        // Given
        let recipesList = RecipesStubs.createRecipsArray()
        let recipes = RecipesStubs.createRecip()
        // When
        sut.didReceiveRecipes(recipes, recipesList)
        // Then
        XCTAssertNotNil(view.recipesList?.first)
        XCTAssertEqual(view.recipesList!.first?.recipe.label, recipesList.first?.recipe.label)
        XCTAssertNotNil(view.recipesList?.last)
        XCTAssertEqual(view.recipesList!.last?.recipe.label, recipesList.last?.recipe.label)
        
    }
    
    func test_showLoading_shouldTriggerViewShowLoading() {
        // When
        sut.showLoading()
        // Then
        XCTAssertTrue(view.isShowingLoading)
    }
    
    func test_hideLoading_shouldTriggerViewHideLoading() {
        // When
        sut.hideLoading()
        // Then
        XCTAssertFalse(view.isShowingLoading)
    }
    
    func test_didReceiveError() {
        // Given
        let error = CustomNetworkError.canNotMapRequest
        // When
        sut.didReceiveError(error)
        // then
        XCTAssertTrue(view.isShowingErrorView)
    }
    
    func test_didReceiveError_errorMessageMatches() {
        // Given
        let error = CustomNetworkError.canNotMapRequest
        // When
        sut.didReceiveError(error)
        // then
        XCTAssertEqual(view.error?.title, error.localizedDescription)
    }
    
    
    func test_didValidation_shouldReturnEmptyString(){
        // Given
      let validation = sut.validateHealthFiltter(text: "All")
        // then
        XCTAssertEqual(validation, "")
        
    }
    
    func test_didValidation_shouldReturnHealthKey(){
        // Given
      let validation = sut.validateHealthFiltter(text: "vegan")
        // then
        XCTAssertEqual(validation, "health")
        
    }
    
}
