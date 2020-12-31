//
//  CheckVerificationViewController.swift
//  LoginVerification
//
//  Created by Evelyn Hasama on 12/30/20.
//

import UIKit

class CheckVerificationViewController: UIViewController {
    override func viewDidLoad() {
        errorLabel.isHidden = true
    }

    @IBOutlet var codeField: UITextField! = UITextField()
    @IBOutlet var errorLabel: UILabel! = UILabel()
    
    var countryCode: String?
    var phoneNumber: String?
    var resultMessage: String?
    
    @IBAction func validateCode() {
        self.errorLabel.text = nil // reset
        if let code = codeField.text {
            VerifyAPI.validateVerificationCode(self.countryCode!, self.phoneNumber!, code) { checked in
                if (checked.success) {
                    self.resultMessage = checked.message
                    self.performSegue(withIdentifier: "successSegue", sender: nil)
                } else {
                    self.errorLabel.text = checked.message
                }
            }
        }
    }
        
}
