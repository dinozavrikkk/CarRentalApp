//
//  BrandModel.swift
//  CarRentalApp
//
//  Created by admin on 08.05.2022.
//

import Foundation
import UIKit

struct BrandModel {
    
    var modelImage: UIImage
    
}

struct DataModelExample {
    
    var modelsInRental: [BrandModel] = [
        BrandModel(modelImage: UIImage(named: "bmw")!),
        BrandModel(modelImage: UIImage(named: "lambo")!),
        BrandModel(modelImage: UIImage(named: "audi")!),
        BrandModel(modelImage: UIImage(named: "ferrari")!),
        BrandModel(modelImage: UIImage(named: "jaguar")!),
        BrandModel(modelImage: UIImage(named: "lexus")!),
        BrandModel(modelImage: UIImage(named: "mers")!),
        BrandModel(modelImage: UIImage(named: "porshe")!)
    ]
  
}
