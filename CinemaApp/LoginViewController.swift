//
//  LoginViewController.swift
//  CinemaApp
//
//  Created by Francesco on 16/10/2018.
//  Copyright © 2018 Francesco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        var mail : String? = mailField.text
        var password : String? = passwordField.text
        
        var users = User.all()
        
        for user in users {
            if user.mail == mail {
                
                if user.password == password {
                    
                    let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "filmListView") as! UIViewController
                    present(storyboard, animated: true, completion: nil)
                    
                }
                else {
                    let alert = UIAlertController(title: "Wrong password", message: "Your password is wrong", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            else {
                
                let alert = UIAlertController(title: "No user found", message: "We can't find your mail, are you already signed?", preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
