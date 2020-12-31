//
//  StartVerificationViewController.swift
//  LoginVerification
//
//  Created by Evelyn Hasama on 12/30/20.
//

import UIKit

class StartVerificationViewController: UIViewController {

    @IBOutlet var countryCodeField: UITextField! = UITextField()
    @IBOutlet var phoneNumberField: UITextField! = UITextField()
    
    @IBAction func sendVerification() {
        if let phoneNumber = phoneNumberField.text,
            let countryCode = countryCodeField.text {
            VerifyAPI.sendVerificationCode(countryCode, phoneNumber)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CheckVerificationViewController {
               dest.countryCode = countryCodeField.text
               dest.phoneNumber = phoneNumberField.text
           }
       }
}

