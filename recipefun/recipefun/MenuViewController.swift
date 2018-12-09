//
//  MenuViewController.swift
//  recipefun
//
//  Created by user145850 on 11/27/18.
//  Copyright © 2018 Daniel Richard. All rights reserved.
//

import UIKit
import CoreData

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var recipeArray = [Recipe]()
 


    
    

    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let randomFilename = UUID().uuidString
        let fullPath = getDocumentsDirectory().appendingPathComponent(randomFilename)
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: recipeArray, requiringSecureCoding: false)
            try data.write(to: fullPath)
        } catch {
            print("Couldn't write file")
        }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: recipeArray, requiringSecureCoding: false)
            if let loadedStrings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String] {
                recipeArray = loadedStrings as! [Recipe]()
            }
        } catch {
            print("Couldn't read file.")
        }
        
        recipeArray.append(Recipe(meal: "d", mealThumb:"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", category:"f",instructions:  "h", youTubeUrl: "H", area:"f", mealID: "j"  ))
        


    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return recipeArray.count
        }
        return 0
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        
        let recipe = recipeArray[indexPath.row]
        cell.update(with: recipe)
        
        cell.showsReorderControl = true
        
        // return the cell
        return cell
        
    }
    
    
    
    @IBAction func addRecipe(_ sender: Any) {
        func getRecipe() -> Recipe{
            
            
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            var recipe = Recipe(meal: "", mealThumb: "", category: "", instructions: "", youTubeUrl: "", area: "", mealID: "")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                
                let responseString = String(data: data, encoding: .utf8)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                var dict = json as! NSDictionary
                
                let meal = dict["meals"] as! NSArray
                let item = meal[0] as! NSDictionary
                
                recipe.area = item["strArea"] as! String
                recipe.category = item["strCategory"] as! String
                recipe.mealID = item["idMeal"] as! String
                recipe.instructions = item["strInstructions"] as! String
                recipe.meal = item["strMeal"] as! String
                recipe.mealThumb = item["strMeal"] as! String
                recipe.youTubeUrl = item["strYoutube"] as! String
                
            }
            task.resume()
            sleep(1)
            print(recipe)
            return recipe
            
            
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if(segue.identifier == "videoSegue"){
        let websiteController = segue.destination as! ViewController
        websiteController.videoCode = "NKtR3KpS83w"
        }
        if(segue.identifier == "detailSegue") {
            // need a reference to the DogDetailViewController that is about to be shown
            if let recipeDetailVC = segue.destination as? RecipeDetailViewController {
                
                // get the dog that was selected
                if let indexPath = tableView.indexPathForSelectedRow {
                    let recipe = recipeArray[indexPath.row]
                    recipeDetailVC.recipe = recipe
                }
            }
        }
        
        
    }
}
