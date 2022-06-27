//
//  HealthFilterModel.swift
//  SoftXpert_Task
//
//  Created by Admin on 26/06/2022.
//

import Foundation


//struct HealthFiltterModel {
//
//     let healthFiltterArray : [ String] = ["All","vegan","kosher","low-fat-abs","low-suger","vegetarian"]
//
//
//}

class HealthFiltterModel :NSObject{
    var name: String = ""

    init(name: String) {
        self.name = name
    }

    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as! String
    }

    func encodeWithCoder(coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
    }
}
