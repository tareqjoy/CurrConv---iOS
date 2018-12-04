//
//  UserRegisterViewController.swift
//  highvoltage
//
//  Created by kuet on 25/9/18.
//  Copyright © 2018 kuet. All rights reserved.
//

import UIKit

class UserRegisterViewController: UIViewController {

    @IBOutlet weak var NameControlView: UITextField! //name text field
    @IBOutlet weak var EmailControlView: UITextField!
    @IBOutlet weak var PasswordControlView: UITextField!
    @IBOutlet weak var ConfirmPasswordControlView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButtonTapped(_ sender: Any) {
        let userName = NameControlView.text
        let userEmail = EmailControlView.text
        let userPassword = PasswordControlView.text
        let userConfirmPassword = ConfirmPasswordControlView.text
        //check empty fields
        if((userName ?? "").isEmpty || (userEmail ?? "").isEmpty || (userPassword ?? "").isEmpty || (userConfirmPassword ?? "").isEmpty){
            //display alart message
        displayAlertMessage(userMessage: "All fields are Required.")
            
            
        }
        //check if password match or not
        if(userPassword != userConfirmPassword){
            displayAlertMessage(userMessage: "Password don't match.")
        }
        //store data
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        
        //alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration Successful.", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {action in self.dismiss(animated: true, completion: nil)})
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
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
