//
//  UserLoginViewController.swift
//  highvoltage
//
//  Created by kuet on 25/9/18.
//  Copyright © 2018 kuet. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailText.text
        let userPassword = userPasswordText.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if(userEmail == userEmailStored){
            if(userPassword == userPasswordStored){
                UserDefaults.standard.set(true, forKey: "loggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
            }
            else{
                displayAlertMessage(userMessage: "Wrong Password. Try again!")
            }
        }
        else{
            displayAlertMessage(userMessage: "No user found. Try again!")
        }
    }
    
    func displayAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
