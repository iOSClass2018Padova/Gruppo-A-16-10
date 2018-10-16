///Users/francesco/Desktop/cinema/Gruppo-A-16-10/CinemaApp.xcodeproj
//  RegisterViewController.swift
//  CinemaApp
//
//  Created by Francesco on 16/10/2018.
//  Copyright © 2018 Francesco. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {
    
    private var users : [User] = []
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var repeatPassField: UITextField!
    
    @IBAction func register(_ sender: Any) {
        
        //let realm = try! Realm()
        
        var name : String? = nameField.text
        var surname : String? = surnameField.text
        var mail : String? = mailField.text
        var password : String?
        
        if (passField.text == repeatPassField.text) {
            password = passField.text
            
            if (name == "" || surname == "" || mail == "" || password == "") {
                
                    let alert = UIAlertController(title: "Attenzione", message: "You left a field or more empty", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                
            }
            else {
                
                if !isValidEmail(testStr: mail!) {
                    
                    let alert = UIAlertController(title: "Attenzione", message: "Email non valida", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                    alert.addAction(okay)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                else {
                
                    let user = User()
                    user.name = name
                    user.surname = surname
                    user.mail = mail
                    user.password = password
                    
                    let realm = try! Realm(configuration: RealmUtils.config)
                    
                    try! realm.write {
                        realm.add(user)
                    }
                    
                    let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "userDetailViewController") as! UIViewController
                    present(storyboard, animated: true, completion: nil)
                    
                }
                
            }
            
        }
        else {
            
            let alert = UIAlertController(title: "Attenzione", message: "Le password inserite non corrispondono", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        users = User.all()
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}
