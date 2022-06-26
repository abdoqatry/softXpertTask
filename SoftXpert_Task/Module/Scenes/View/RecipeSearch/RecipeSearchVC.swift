//
//  RecipeSearchVC.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import UIKit

class RecipeSearchVC: UIViewController {

    // MARK: - Dependencies
    
    var interactor: RecipesListViewToInteractorProtocol?
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var recipeTabelView: UITableView!{
        didSet {
            recipeTabelView.delegate = self
            recipeTabelView.dataSource = self
            recipeTabelView.registerCell(withCellType: RecipeTabelViewCell.self)
        }
    }
    
    // MARK: - Private Properties
    private var recipesList : [Recipe.Hits] = []
    private var recipes : Recipe?
    private let cellHeight = 140.0
    private var from = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchAllRecipes(searchText: "Chicken", from: from, health: "vegan")
    }



}


extension RecipeSearchVC: RecipesListViewProtocol {
   
    func showRecipesList(_ recipes: Recipe,_ recipeList: [Recipe.Hits]) {
        self.recipes = recipes
        self.recipesList.append(contentsOf: recipeList)
        recipeTabelView.reloadData()
    }
    
}


extension RecipeSearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeTabelViewCell = recipeTabelView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(viewModel: (recipesList[indexPath.row]))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = (recipes?.hits.count ?? 0) - 1
        if indexPath.item == lastItem{
            if recipes?.more == true {
                interactor?.fetchAllRecipes(searchText: "Chicken", from: from + 10, health: "vegan")
            }
        }
        
    }
    
    
}


extension RecipeSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
