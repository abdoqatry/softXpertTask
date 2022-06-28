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
     var recipesList : [Recipe.Hits] = [] {
        didSet{
        recipeTabelView.reloadData()
        }
    }
     var recipes : Recipe?
     let cellHeight = 140.0
     var from = 1
     var healthValue = "All"
     var health = [HealthFiltterModel]()
     var currentSelected:Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       addHealthFiltter()
        setView()
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
                interactor?.fetchAllRecipes(searchText: searchTF.text ?? "", from: from + 10, health: healthValue, healthKey: healthValue)
            }
        }
        
    }
    
    
    
    
}


extension RecipeSearchVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}


extension RecipeSearchVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.recipesList.removeAll()
        interactor?.fetchAllRecipes(searchText: searchTF.text ?? "", from: from, health: healthValue, healthKey: healthValue)
        view.endEditing(true)
        return true
    }
    
}


extension RecipeSearchVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        health.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HealthFiltterCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
//        cell.selectionStyle = .gray
        if currentSelected == indexPath.row{
            cell.titleLabel.backgroundColor = .red
        }else{
            cell.titleLabel.backgroundColor = .clear
        }
        cell.configure(viewModel: health[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //add here
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
    }
    
    
}

extension RecipeSearchVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.healthValue = health[indexPath.row].name
        currentSelected = indexPath.row
        healthCollectionView.reloadData()
        self.recipesList.removeAll()
        interactor?.fetchAllRecipes(searchText: searchTF
                                        .text ?? "", from: from, health: healthValue, healthKey: healthValue)
    }
    
    
    
}
