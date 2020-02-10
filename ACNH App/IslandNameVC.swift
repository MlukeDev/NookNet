//
//  IslandNameVC.swift
//  ACNH App
//
//  Created by Matt Luke on 2/8/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class IslandNameVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var islandName = "Your Town"
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedReturn(_ sender: UITextField) {
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        islandName = nameTextField.text ?? "Your Town"
        print(islandName)
        performSegue(withIdentifier: "unwindToTodayPage", sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
