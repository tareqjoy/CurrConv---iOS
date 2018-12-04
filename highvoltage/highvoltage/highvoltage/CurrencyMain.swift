//
//  CurrencyMain.swift
//  highvoltage
//
//  Created by kuet on 6/11/18.
//  Copyright © 2018 kuet. All rights reserved.
//

import UIKit

struct Rates : Decodable {
    
    //let AUD : Float?
    let rate : Float?
    
}



struct WebsiteDescription: Decodable {
    let bdt : Rates
    let aud : Rates
    let eur : Rates
    let inr : Rates
    let kwd : Rates
}
    var country1:String="bdt"
class CurrencyMain: UIViewController {



    
    @IBOutlet weak var fromComboBox: UIButton!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var convertBtn: UIButton!
    @IBOutlet weak var toTextField: UITextField!
  
  

    
    


    
  
    

    @IBOutlet var currencyButtons: [UIButton]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertTapped(_ sender: Any) {
        print("json error","hello")
        //self.dismiss(animated: true, completion: nil)
    //    let fromstr = from.text
   //     let tostr = toTextField.text
        
   //     var a = Float(fromstr!)!
        
   //     let b = a * 83.9356
        
    //    toTextField.text = String(b)
        let url=URL(string:"https://www.floatrates.com/daily/usd.json?fbclid=IwAR16PzdMuqTFrwxdwi3G4F05GsyScQBWjJl_Behblw91LJvqVVEi9P_TtVs")!
        URLSession.shared.dataTask(with: url){
            (data,response,error) in
            do{
                /*
                 let json=try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any]
                 let course = Course(json: json!)
                 
                 */
                let website = try JSONDecoder().decode(WebsiteDescription.self, from: data!)
                
                //print(website.name)
                
                //
                //print(website)
                
                DispatchQueue.main.async {
                    var names = [String] ()
                    var value = [Float] ()
                    names.append("inr" )
                    names.append("aud" )
                    names.append("kwd" )
                    names.append("eur" )
                    names.append("bdt" )
                    
                    value.append(website.inr.rate!)
                    value.append(website.aud.rate!)
                    value.append(website.kwd.rate!)
                    value.append(website.eur.rate!)
                    value.append(website.bdt.rate!)
                    
                    
                    var country2:String="bdt"
                    
                    var input:Float = Float(self.from.text!)!
                    var result:Float=0.0
                    var result1:Float=0.0
                    var result2:Float=0.0
                    for i in 0...4 {
                        if  names[i] == country1 {
                            result1 = value[i]
                        }
                        if  names[i] == country2 {
                            result2 = value[i]
                        }
                    }
                    if country1 == "usd" {
                        result1=1.0
                    }
                    if country2 == "usd" {
                        result2=1.0
                    }
                    result = (input/result1)*result2
                    print("result", result.description)
                    self.toTextField.text = result.description
                }
                
                
            }
            catch let jsonError{
                //error
                print("json error",jsonError)
            }
            }.resume()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
       
                let isUserLoggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
        if(!isUserLoggedIn)
        {
             self.performSegue(withIdentifier: "login_view", sender: self)
        }
       
    }
    
    @IBAction func logmeout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "loggedIn")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "login_view", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
    @IBAction func handleSelection(_ sender: UIButton) {
        currencyButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                 button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
           
            
        }
    }
    
  
    
    enum Currency: String {
        case BDT = "BDT"
        case USD = "USD"
        case EUR = "EUR"
        case INR = "INR"
    }
    
    @IBAction func currencyTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let currency = Currency(rawValue: title) else {
            return
        }
        
        switch currency {
        case .INR:
            print("INR")
            country1 = "inr"
            fromComboBox.setTitle("INR", for: .normal)
            handleSelection(btn)
        case .USD:
            print("USD")
            fromComboBox.setTitle("USD", for: .normal)
            country1 = "usd"
            handleSelection(btn)
        case .BDT:
            print("BDT")
            fromComboBox.setTitle("BDT", for: .normal)
            country1 = "bdt"
            handleSelection(btn)
        default:
            print("EUR")
            fromComboBox.setTitle("EUR", for: .normal)
            country1 = "eur"
            handleSelection(btn)
        }
    }

    
}
