//
//  MenuViewController.swift
//  recipefun
//
//  Created by user145850 on 11/27/18.
//  Copyright © 2018 Daniel Richard. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let websiteController = segue.destination as! ViewController
        
        if segue.identifier == "videoSegue" {
            websiteController.videoCode = "NKtR3KpS83w"}
    }

}
