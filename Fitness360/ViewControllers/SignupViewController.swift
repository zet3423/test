//
//  SignupViewController.swift
//  Fitness360
//
//  Created by Sam KC on 3/31/20.
//  Copyright © 2020 BitBoard. All rights reserved.
//

import UIKit
import UIKit
import Amplify
import AmplifyPlugins
import AWSMobileClient


class SignupViewController: UIViewController {


    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var errorlabel: UILabel!
    
    @IBAction func Signup(_ sender: Any) {
                errorlabel.text = signup(username: username.text!, password: password.text!, email: email.text!, phone: phone.text!)
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

func signup(username: String, password: String, email: String, phone: String) -> String {
    
   
    
    var returntext: String = ""
    
    
    
    
    AWSMobileClient.default().signUp(username: username,
                                            password: password,
                                            userAttributes: ["email":email, "phone_number": "+1" + phone]) { (signUpResult, error) in
        if let signUpResult = signUpResult {
            switch(signUpResult.signUpConfirmationState) {
            case .confirmed:
                print("User is signed up and confirmed.")
                returntext = "User is signed up and confirmed."
            case .unconfirmed:
                print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                
                returntext = "User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)"
                
            case .unknown:
                print("Unexpected case")
                returntext = "Unexpected case"
            }
        } else if let error = error {
            if let error = error as? AWSMobileClientError {
                switch(error) {
                case .usernameExists(let message):
                    print(message)
                    returntext = message
                default:
                    break
                }
            }
            print("\(error.localizedDescription)")
            returntext = "\(error.localizedDescription)"
            
        }
    
    }
    sleep(1)
    return returntext
    
}
