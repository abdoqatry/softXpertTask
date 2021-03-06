//
//  RecipeTabelViewCell.swift
//  SoftXpert_Task
//
//  Created by Admin on 25/06/2022.
//

import UIKit
import Kingfisher

class RecipeTabelViewCell: UITableViewCell,Reuseable {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTittleLabel: UILabel!
    @IBOutlet weak var RecipeSourceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    // MARK: - Public Functions
    
    func configure(viewModel: Recipe.Hits){
        recipeTittleLabel.text = viewModel.recipe.label
        RecipeSourceLabel.text = viewModel.recipe.source
        if let url = URL(string: viewModel.recipe.image){
            recipeImage.kf.setImage(with:url)
        }
    }
    
}
