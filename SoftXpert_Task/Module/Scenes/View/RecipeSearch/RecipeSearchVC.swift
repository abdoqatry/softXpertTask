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
    @IBOutlet weak var healthCollectionView: UICollectionView!{
        didSet {
            healthCollectionView.delegate = self
            healthCollectionView.dataSource = self
            healthCollectionView.registerCell(withCellType: HealthFiltterCollectionCell.self)
        }
    }
    
    // MARK: - Private Properties
    private var recipesList : [Recipe.Hits] = []
    private var recipes : Recipe?
    private let cellHeight = 140.0
    private var from = 1
    private var healthValue = "All"
    private var health = [HealthFiltterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       addHealthFiltter()
        setView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
        healthCollectionView.selectItem(at: indexPathForFirstRow, animated: false, scrollPosition: .left)
    }

    
    func addHealthFiltter(){
        health.append(HealthFiltterModel(name: "All"))
        health.append(HealthFiltterModel(name: "vegan"))
        health.append(HealthFiltterModel(name: "kosher"))
        health.append(HealthFiltterModel(name: "vegetarian"))
        healthCollectionView.reloadData()
    }
    
    func setView(){
        searchTF.delegate = self
        searchTF.returnKeyType = UIReturnKeyType.search
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
//        let lastItem = (recipes?.hits.count ?? 0) - 1
//        if indexPath.item == lastItem{
//            if recipes?.more == true {
//                interactor?.fetchAllRecipes(searchText: "Chicken", from: from + 10, health: "vegan")
//            }
//        }
        
    }
    
    
}


extension RecipeSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}


extension RecipeSearchVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        interactor?.fetchAllRecipes(searchText: searchTF.text ?? "", from: from, health: healthValue, healthKey: healthValue)
        return true
    }
    
}


extension RecipeSearchVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        health.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HealthFiltterCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(viewModel: health[indexPath.row])
     
        return cell
    }
}

extension RecipeSearchVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.healthValue = health[indexPath.row].name
        self.recipesList.removeAll()
        interactor?.fetchAllRecipes(searchText: searchTF
                                        .text ?? "", from: from, health: healthValue, healthKey: healthValue)
    }
}
