//
//  Recipe.swift
//  recipefun
//
//  Created by McKenzie, Thomas Patrick on 12/8/18.
//  Copyright © 2018 Daniel Richard. All rights reserved.
//

import Foundation
import CoreData

class Recipe{

    var area: String
    var category: String
    var instructions: String
    var meal: String
    var mealThumb: String
    var youTubeUrl: String
    var mealID: String


    init(meal: String, mealThumb:String, category:String, instructions: String, youTubeUrl: String, area: String, mealID: String){
    self.meal = meal
    self.mealThumb = mealThumb
    self.instructions = instructions
        self.category = category
        self.youTubeUrl = youTubeUrl
        self.area = area
        self.mealID = mealID
    }
}
