//
//  RecipesListViewControllerTest.swift
//  SoftXpert_TaskTests
//
//  Created by Admin on 27/06/2022.
//

import XCTest
@testable import SoftXpert_Task

class RecipeViewControllerTest: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: RecipeSearchVC!
    var eventListInteractorSpy: RecipeListInteractorSpy!
    let tableViewSpy = TableViewSpy()
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        
        sut = RecipeSearchVC.loadFromNib()
        
        UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?.addSubview(sut.view)
        sut.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()

    }
    
    
    func test_fetchedRecipeList_shouldReloadTableView() {
        // Given
        sut.recipeTabelView = tableViewSpy
        
        // When
        let recipesList = RecipesStubs.createRecipsArray()
        let recipes = RecipesStubs.createRecip()
        
        sut.showRecipesList(recipes, recipesList)
        
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled)
    }
    
    func test_numberOfRowsInSection_shouldEqaulNumberOfEventsToDisplay() {
        // Given
        let testDisplayedRecipes = RecipesStubs.createRecipsArray()
        sut.recipesList = testDisplayedRecipes
        sut.recipeTabelView?.reloadData()
        
        // When
        let numberOfRows = sut.tableView(sut.recipeTabelView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, testDisplayedRecipes.count)
    }
    
    
}
