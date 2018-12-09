//
//  Recipe.swift
//  recipefun
//
//  Created by McKenzie, Thomas Patrick on 12/8/18.
//  Copyright © 2018 Daniel Richard. All rights reserved.
//

import Foundation
import CoreData

class Recipe: NSObject{

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
    
    
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encode(self.area, forKey:"area")
        aCoder.encode(self.category, forKey:"category")
        aCoder.encode(self.instructions, forKey:"instructions")
        aCoder.encode(self.meal, forKey:"meal")
        aCoder.encode(self.mealThumb, forKey:"mealThumb")
        aCoder.encode(self.youTubeUrl, forKey:"youtTubeUrl")
        aCoder.encode(self.mealID, forKey:"mealID")
    }
    
    
    init (coder aDecoder: NSCoder!) {
        self.area = aDecoder.decodeObject(forKey: "area") as! String
        self.category = aDecoder.decodeObject(forKey: "category") as! String
        self.instructions = aDecoder.decodeObject(forKey: "instructions") as! String
        self.meal = aDecoder.decodeObject(forKey: "meal") as! String
        self.mealThumb = aDecoder.decodeObject(forKey: "mealThumb") as! String
        self.youTubeUrl = aDecoder.decodeObject(forKey: "youTubeUrl") as! String
        self.mealID = aDecoder.decodeObject(forKey: "mealID") as! String
        

    }
}
