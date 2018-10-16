//
//  RegisterPageViewController.swift
//  CinemaApp
//
//  Created by Francesco on 16/10/2018.
//  Copyright © 2018 Francesco. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
        
        var name : String? = nameField.text
        var surname : String? = surnameField.text
        var email : String? = mailField.text
        var password : String?
        
        if passwordField == repeatPasswordField {
            password = passwordField.text
        }
        else {
            let alert = UIAlertController(title: "Attenzione", message: "Le due password non corrispondono", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
