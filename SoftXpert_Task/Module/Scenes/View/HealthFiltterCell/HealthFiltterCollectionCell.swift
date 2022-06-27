//
//  HealthFiltterCollectionCell.swift
//  SoftXpert_Task
//
//  Created by Admin on 26/06/2022.
//

import UIKit

class HealthFiltterCollectionCell: UICollectionViewCell,Reuseable {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configure(viewModel:HealthFiltterModel ){
        titleLabel.text = viewModel.name
    }
}
